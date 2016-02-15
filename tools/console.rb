require_relative '../config/environment.rb'

def reload!
  load('../config/environment.rb')
end

#binding.pry

puts "\n----------------------------"
puts "-------- YOUR MOVIE --------"
puts "-------- COLLECTION --------"
puts "--------- MANAGER ----------"
puts "----------------------------"
puts "\nEnter your name to create your profile."
user_name = gets.chomp
current_user = User.new(user_name)
puts "\nWelcome #{current_user.name}"
action = ""
while action != "exit"
  puts "\nWhat action would you like to take?"
  puts "Your options are: add, lookup, update, delete, and exit"
  action = gets.chomp
  exit if action == 'exit'
  puts "\n Great. What movie would you like to act on?"
  movie_name = gets.chomp
  case action
    when 'add'
      current_user.add_movie_by_name(movie_name)
      #handle case where movie is not found
    when 'lookup'
      Movie.display_movie_data_by_name(movie_name)
    when 'update'
    when 'delete'
  end
end
