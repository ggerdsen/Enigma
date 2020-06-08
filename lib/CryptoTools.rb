require_relative './modules/cipherable'

class CryptoTools
  include Cipherable
  
  def analyze(message, key, date, encrypt)
    cipher(message, key, date, encrypt)
  end
  
  def character_array
    ("a".."z").to_a << " "
  end

  def shift(key, date)
    key_array = []
    x = 0
    key_shift(key).each do |k, value|
      key_array << value + offset_shift(date)[x]
      x += 1
    end
    key_array
  end

  def offset_shift(date)
    generate_offsets(date)
  end

  def key_shift(key)
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

  def generate_key
    rand(99999).to_s.rjust(5,'0')
  end

  def generate_offsets(date)
    raw_offsets = date.to_i**2
    last_four = raw_offsets.to_s.chars.last(4).join
    split_offsets(last_four)
  end

  def split_offsets(last_four)
    offset_array = []
    last_four.split("").each { |digit| offset_array << digit.to_i}
    offset_array
  end
  
end