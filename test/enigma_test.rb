require_relative "./helper_test"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end


  def test_it_can_open_files
    # ruby ./lib/encrypt.rb
  end

end
