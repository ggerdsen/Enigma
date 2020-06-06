require_relative "./helper_test"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_create_character_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, Enigma.character_array
  end

  def test_it_can_generate_random_key
    Enigma.expects(:generate_key).returns(rand(99999).to_s.rjust(5,'0'))
    assert Enigma.generate_key
  end

  def test_it_can_generate_random_offsets
    Enigma.expects(:generate_offsets).returns(rand(9999))
    assert Enigma.generate_offsets
  end

  # def test_genertate_offsets_helper_method
  #   skip
  #   Enigma.expects(:split_offsets("1234")).returns(rand(9999))
  #   assert Enigma.split_offsets("1234")
  # end

end
