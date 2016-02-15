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
  puts "\n Would you like to work on your profile or your collection?"
  prof_or_coll = gets.chomp
  case prof_or_coll
  when 'collection'
    puts "\nWhat action would you like to take?"
    puts "Your options are: add, remove, lookup, and exit"
    action = gets.chomp
    exit if action == 'exit'
    puts "\n Great. What movie would you like to act on?"
    movie_name = gets.chomp
    case action
      when 'add'
        current_user.add_movie_by_name(movie_name)
        binding.pry
      when 'lookup'
        Movie.display_movie_data_by_name(movie_name)
      when 'remove'
        current_user.delete_movie_by_name(movie_name)
    end
  when 'profile'
    puts "Now we'll work on your profile."
    puts "View collection(C), view the last movie you added (L), view your profile (P), or find your favorite genre (G)?"
    action = gets.chomp
    case action
      when 'C'
        current_user.movies
      when 'L'
        Movies.find_movie_data_by_name(current_user.movies.last)
      when 'P'
        current_user.get_profile
      when 'G'
        current_user.get_fav_genre
    end
  end
end
