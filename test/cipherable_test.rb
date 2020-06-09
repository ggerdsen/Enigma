require_relative "./helper_test"
require './lib/enigma'

class CipherableTest < Minitest::Test
  
  def setup
    @cryptotools = CryptoTools.new
  end
  
  def test_it_exists
    assert_equal Module, Cipherable.class
  end
  


end