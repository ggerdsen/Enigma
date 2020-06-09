require_relative "./helper_test"
require './lib/enigma'

class CrytpoToolsTest < Minitest::Test

  def setup
    @cryptotools = CryptoTools.new
    @enigma = Enigma.new
  end

  def test_it_exists
    @cryptotools = CryptoTools.new
    assert_instance_of CryptoTools, @cryptotools
  end

  def test_it_can_create_character_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cryptotools.character_array
  end

  def test_it_can_combine_to_shift
    key = "23189"
    date = "060620"
    expected = [27, 35, 18, 89]
    assert_equal expected, @cryptotools.shift(key, date)
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
    assert_equal expected, @cryptotools.generate_offsets(date)
  end
  
  def test_it_can_generate_random_offsets_via_offset_shift
    date = "060620"
    expected = [4,4,0,0]
    assert_equal expected, @cryptotools.offset_shift(date)
  end

  def test_it_can_combine_key_offset
    key = "23189"
    date = "060620"
    expected = [27,35,18,89]
    assert_equal expected, @cryptotools.shift(key, date)
  end

end
