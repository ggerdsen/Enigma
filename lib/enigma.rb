require 'date'
require_relative 'cryptotools'

class Enigma < CryptoTools

  def encrypt(ciphertext, key, date)
    analyze(ciphertext, key, date, "encrypt")
  end

  def decrypt(ciphertext, key, date)
    analyze(ciphertext, key, date, "decrypt")
  end
  
end


# ruby lib/encrypt.rb message.txt encrypted.txt
# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 21606 080620