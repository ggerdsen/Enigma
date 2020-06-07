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
    expected = [27,35,18,89]
    assert_equal expected, Enigma.shift(key, date)
  end

  def test_it_can_encrypt_message
    expected = {
                :encryption=>"ruyiy,mtygya!",
                :key=>"06678",
                :date=>"060620"
                }
    key = "06678"
    date = "060620"
    message = "Hello, World!"
    # binding.pry
    assert_equal expected, Enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt_message
    expected = {
                :decryption=>"Hello, World!",
                :key=>"06678",
                :date=>"060620"
                }
    key = "06678"
    date = "060620"
    message = "ruyiy,mtygya!"
    binding.pry
    assert_equal expected, Enigma.decrypt(message, key, date)
  end

end
