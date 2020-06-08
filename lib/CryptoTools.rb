class CryptoTools
  
  def self.cipher(message, key, date, encrypt)
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
  
  def self.character_array
    ("a".."z").to_a << " "
  end

  def self.shift(key, date)
    key_array = []
    x = 0
    key_shift(key).each do |k, value|
      key_array << value + offset_shift(date)[x]
      x += 1
    end
    key_array
  end

  def self.offset_shift(date)
    generate_offsets(date)
  end

  def self.key_shift(key)
    key_hash = Hash.new(0)
    x = 0
    y = 1
    ["a","b","c","d"].each do |letter|
      key_hash[letter] = key.slice(x..y).to_i
      x += 1
      y += 1
    end
    key_hash
  end

  def self.generate_key
    rand(99999).to_s.rjust(5,'0')
  end

  def self.generate_offsets(date)
    raw_offsets = date.to_i**2
    last_four = raw_offsets.to_s.chars.last(4).join
    split_offsets(last_four)
  end

  def self.split_offsets(last_four)
    offset_array = []
    last_four.split("").each { |digit| offset_array << digit.to_i}
    offset_array
  end
  
end