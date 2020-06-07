require 'date'

class Enigma

  def self.encrypt(message, key, date)
    shift(key, date)
  end

  def self.character_array
    ("a".."z").to_a << " "
  end

  def self.shift(key, date)
    key_hash = Hash.new(0)
    x = 0
    key_shift(key).each do |k, value|
      key_hash[k] = value + offset_shift(date)[x]
      x += 1
    end
    key_hash
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
