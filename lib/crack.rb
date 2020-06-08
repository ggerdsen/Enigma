require 'pry'
require './lib/enigma'

enigma = Enigma.new

file = File.open('lib/'+ARGV[0], "r")
message = file.read
file.close

date = Date.today.strftime("%d%m%y") if ARGV[2] == nil
date = ARGV[2] if ARGV[2] != nil

decrypted_message = enigma.crack(message, date)

# File.write 'lib/'+ARGV[1], decrypted_message[:decryption]

# puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
