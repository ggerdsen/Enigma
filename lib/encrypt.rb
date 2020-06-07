
require 'pry'
require_relative 'enigma'


class Encrypt < Enigma
end

file = File.open(ARGV[0], "r")
message = file.read
file.close

date_today = Date.today.strftime("%d%m%y")
encrypted_message = Enigma.encrypt(message, Enigma.generate_key, date_today)
p File.write ARGV[1], encrypted_message[:encryption]

# p Enigma.generate_key
# p Enigma.generate_offsets
# Encrypt.message(message, key, date)


