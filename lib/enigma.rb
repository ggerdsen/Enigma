require 'date'
require_relative 'cryptotools'


class Enigma < CryptoTools

  def encrypt(message, key, date)
    analyze(message, key, date, true)
  end

  def decrypt(message, key, date)
    analyze(message, key, date, false)
  end

end
