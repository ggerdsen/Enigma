require_relative "./helper_test"
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_can_open_files
    ruby ./lib/encrypt.rb
  end

end
