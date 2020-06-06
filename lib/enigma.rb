require 'date'

class Enigma

  def self.generate_key
    rand(99999).to_s.rjust(5,'0')
  end

  def self.generate_offset
    raw_offsets = Date.today.strftime("%d%m%y").to_i**2
    raw_offsets.to_s.chars.last(4).join.to_i
    # binding.pry
  end
  #
  # Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
  # Square the numeric form (1672401025) x
  # Take the last four digits (1025) x
  # A offset: The first digit (1)
  # B offset: The second digit (0)
  # C offset: The third digit (2)
  # D offset: The fourth digit (5)


end
