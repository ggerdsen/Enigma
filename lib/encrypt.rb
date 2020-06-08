require 'pry'
require_relative "./enigma"


class Encrypt < Enigma
end

file = File.open('lib/'+ARGV[0], "r")
message = file.read
file.close
#
date_today = Date.today.strftime("%d%m%y")
p encrypted_message = Enigma.encrypt(message, Enigma.generate_key, date_today)
File.write 'lib/'+ARGV[1], encrypted_message[:encryption]

# p Enigma.generate_key
# p Enigma.generate_offsets
# Encrypt.message(message, key, date)


