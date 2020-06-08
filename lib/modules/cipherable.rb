module Cipherable
  
  def cipher(message, key, date, encrypt)
    shifter = shift(key, date)
    decrypted_message = []
    encrypted_index = 0
    shift_counter = 0
    return_hash = Hash.new(0)
    message.each_char do |char|
      if character_array.include?(char.downcase)
        plain_index = character_array.index(char.downcase)
        shifted_index = shifter.rotate(shift_counter).first
        encrypted_index = plain_index + shifted_index if encrypt == true
        encrypted_index = plain_index - shifted_index if encrypt == false
        decrypted_message << character_array.rotate(encrypted_index).first
      else
        decrypted_message << char
      end
      shift_counter += 1
    end
    return_hash[:encryption] = decrypted_message.join if encrypt == true
    return_hash[:decryption] = decrypted_message.join if encrypt == false
    return_hash[:key] = key
    return_hash[:date] = date
    return_hash
  end
  
end