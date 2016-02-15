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
puts "\nEnter your favorite movie name."
movie_name = gets.chomp
current_user.add_movie_by_name(movie_name)
current_user.favorite_movie = movie_name
puts "Added #{movie_name} to your collection and set it as your favorite."
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
    controller = MoviesController.new
    movie_name = controller.prompt_movie_name
    case action
      when 'add'
        #should be handeled by users controller#add which then calls ../views/user/add#render (that file just outputs line 34)
        controller=UserController.new
        controller.add(current_user, movie_name)
        # puts "Added #{movie_name} to your collection."
      when 'lookup'
        controller = MoviesController.new
        controller.display(movie_name)
      when 'remove'
        #should be handeled by users controller#remove which then calls ../views/user/remove#render (that file just outputs line 41)
        controller=UserController.new
        controller.remove(current_user, movie_name)
        # current_user.delete_movie_by_name(movie_name)
        # puts "Removed #{movie_name} from your collection."
    end
  when 'profile'
    controller=UserController.new
    controller.start
    case action
      when 'C'
        puts current_user.movies
      when 'L'
        puts Movie.find_movie_data_by_name(current_user.last_movie_added)
      when 'P'
        #should be handeld by users controller#get_profile
        puts current_user.view_profile
      when 'G'
        #should be handeled by users controller#favgenre
        puts current_user.get_fav_genre
    end
  end
  "---------------------------"
end
