require 'pry'
require './lib/enigma'

class Encrypt < Enigma
end

file = File.open('lib/'+ARGV[0], "r")
message = file.read
file.close

date_today = Date.today.strftime("%d%m%y")
# binding.pry
p decrypted_message = Enigma.decrypt(message, ARGV[2], ARGV[3])
File.write 'lib/'+ARGV[1], decrypted_message[:decryption]


# p Enigma.generate_key
# p Enigma.generate_offsets
# Encrypt.message(message, key, date)


#ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 933136 070620

#ruby encrypt.rb message.txt encrypted.txt

#function erase_history { local HISTSIZE=0; }
# erase_history
