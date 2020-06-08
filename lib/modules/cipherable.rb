module Cipherable
  
  def cipher(cipher_data)
    
    ciphered_message = []
    encrypted_index = 0
    shift_counter = 0
    return_hash = Hash.new(0)
    cipher_data[:ciphertext].each_char do |char|
      if character_array.include?(char.downcase)
        index = character_array.index(char.downcase)
        shifted_index = cipher_data[:shifter].rotate(shift_counter).first
        new_index = index + shifted_index if cipher_data[:task] == "encrypt"
        new_index = index - shifted_index if cipher_data[:task] == "decrypt"
        ciphered_message << character_array.rotate(new_index).first
      else
        ciphered_message << char
      end
      shift_counter += 1
    end
    return_hash[:encryption] = ciphered_message.join if cipher_data[:task] == "encrypt"
    return_hash[:decryption] = ciphered_message.join if cipher_data[:task] == "decrypt"
    return_hash[:key] = cipher_data[:key]
    return_hash[:date] = cipher_data[:date]
    return_hash
  end
  
end