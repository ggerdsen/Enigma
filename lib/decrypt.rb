require 'pry'
require './lib/enigma'

enigma = Enigma.new

file = File.open('lib/'+ARGV[0], "r")
message = file.read
file.close

date_today = Date.today.strftime("%d%m%y")
decrypted_message = enigma.decrypt(message, ARGV[2], ARGV[3])

File.write 'lib/'+ARGV[1], decrypted_message[:decryption]

puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
