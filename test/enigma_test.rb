require_relative "./helper_test"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_create_character_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.character_array
  end

  def test_it_can_combine_to_shift
    key = "23189"
    date = "060620"
    expected = [27, 35, 18, 89]
    assert_equal expected, @enigma.shift(key, date)
  end

  def test_it_can_generate_random_key_mock_stub
    @enigma.expects(:generate_key).returns(rand(99999).to_s.rjust(5,'0'))
    assert @enigma.generate_key
  end

  def test_it_can_generate_random_key
    assert_equal String, @enigma.generate_key.class
    assert_equal 5, @enigma.generate_key.length
  end

  def test_it_can_generate_random_offsets
    date = "060620"
    expected = [4,4,0,0]
    assert_equal expected, @enigma.generate_offsets(date)
  end
  
  def test_it_can_generate_random_offsets_via_offset_shift
    date = "060620"
    expected = [4,4,0,0]
    assert_equal expected, @enigma.offset_shift(date)
  end

  def test_it_can_combine_key_offset
    key = "23189"
    date = "060620"
    expected = [27,35,18,89]
    assert_equal expected, @enigma.shift(key, date)
  end
  
  def test_it_can_split_offsets_to_array
    expected = [4, 4, 0, 0]
    last_four = "4400"
    assert_equal expected, @enigma.split_offsets(last_four)
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
    assert_equal expected, @enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt_message
    expected = {
                :decryption=>"hello, world!",
                :key=>"06678",
                :date=>"060620"
                }
    key = "06678"
    date = "060620"
    message = "ruyiy,mtygya!"
    assert_equal expected, @enigma.decrypt(message, key, date)
  end

end
