require_relative "./helper_test"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_random_key
    Enigma.expects(:generate_key).returns(rand(99999).to_s.rjust(5,'0'))
    assert Enigma.generate_key
  end

  def test_it_can_generate_random_offsets
    Enigma.expects(:generate_offsets).returns(rand(9999))
    assert Enigma.generate_offsets
  end

end
