require 'pry'
require_relative "./enigma"

enigma = Enigma.new

file = File.open('lib/'+ARGV[0], "r")
message = file.read
file.close

date_today = Date.today.strftime("%d%m%y")
encrypted_message = enigma.encrypt(message, enigma.generate_key, date_today)

File.write 'lib/'+ARGV[1], encrypted_message[:encryption]

puts "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"


