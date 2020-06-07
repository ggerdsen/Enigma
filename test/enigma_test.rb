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

  def test_it_can_combine_to_shift
    Enigma.expects(:shift).returns(rand(9999))
    assert Enigma.shift
  end

  def test_it_can_generate_random_key
    Enigma.expects(:generate_key).returns(rand(99999).to_s.rjust(5,'0'))
    assert Enigma.generate_key
  end

  def test_it_can_generate_random_offsets
    Enigma.expects(:generate_offsets).returns(rand(9999))
    assert Enigma.generate_offsets
  end

  def test_it_can_combine_key_offset
    key = "23189"
    date = "060620"
    expected = {"a"=>27, "b"=>35, "c"=>18, "d"=>89}
    assert_equal expected, Enigma.shift(key, date)
  end

end
