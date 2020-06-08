require 'date'
require_relative 'cryptotools'
# require_relative './modules/cipherable'

class Enigma < CryptoTools

  def self.encrypt(message, key, date)
    cipher(message, key, date, true)
  end

  def self.decrypt(message, key, date)
    cipher(message, key, date, false)
  end

end
