require 'pry'
require_relative 'enigma'


class Encrypt < Enigma
end

file = File.open(ARGV[0], "r")
message = file.read
file.close

date_today = Date.today.strftime("%d%m%y")

File.write ARGV[1], Enigma.encrypt(message, Enigma.generate_key, date_today)
# p Enigma.generate_key
# p Enigma.generate_offsets
# Encrypt.message(message, key, date)