require 'date'
require_relative 'cryptotools'


class Enigma < CryptoTools

  def encrypt(ciphertext, key, date)
    analyze(message, key, date, "encrypt")
  end

  def decrypt(ciphertext, key, date)
    analyze(message, key, date, "decrypt")
  end
  
  def crack(ciphertext, date)
    p date
    # analyze(message, key, date, "crack")
  end
end
