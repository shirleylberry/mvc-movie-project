require_relative '../config/environment.rb'

puts "\n----------------------------"
puts "-------- YOUR MOVIE --------"
puts "-------- COLLECTION --------"
puts "--------- MANAGER ----------"
puts "----------------------------"
puts "\nEnter your name to create your profile."
user_name = gets.chomp
current_user = User.new(user_name)
puts "\nWelcome #{current_user.name}"
puts "\nWhat action would you like to take?"
puts "Your options are: add, lookup, update, delete, and exit"
action = gets.chomp

while action != "exit"
  case action
    when 'add'
    when 'lookup'
    when 'update'
    when 'delete'
  end
  exit(1)
end
