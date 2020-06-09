require_relative "./helper_test"
require './lib/enigma'

class CipherableTest < Minitest::Test
  
  def setup
    @cryptotools = CryptoTools.new
  end

  def test_it_exists
    assert_equal Module, Cipherable.class
  end

  def test_it_can_encrypt_message
    key = "23189"
    date = "060620"
    message = "Hello, world!"
    task = "encrypt"
    shifter = @cryptotools.shift(key, date)
    crack_offset = @cryptotools.generate_offsets(date)
    cipher_data = {ciphertext: message, key: key, date: date,
                  shifter: shifter, task: task, crack_offset:
                  crack_offset}
    expected = {:encryption=>"hmcto,rdozcl!", :key=>"23189", :date=>"060620"}
    assert_equal expected, @cryptotools.cipher(cipher_data)
  end

end