require_relative '../config/environment.rb'

def reload!
  load('../config/environment.rb')
end

#binding.pry

user_controller = UserController.new
current_user = user_controller.new_user
while(current_user.movies.size == 0)
  puts "\nEnter your favorite movie name."
  movie_name = gets.chomp.capitalize
  current_user.add_movie_by_name(movie_name)
  current_user.favorite_movie = movie_name
end
puts "Added #{movie_name} to your collection and set it as your favorite."
action = ""
while action != "exit"
  user_controller=UserController.new
  movie_controller = MoviesController.new
  puts "\n Would you like to work on your profile or your collection or exit?"
  prof_or_coll = gets.chomp
  exit if prof_or_coll == 'exit'
  case prof_or_coll
  when 'collection'
    action = movie_controller.start
    exit if action == 'exit'
    movie_name = movie_controller.prompt_movie_name.capitalize
    case action
      when 'add'
        user_controller.add(current_user, movie_name)
      when 'lookup'
        user_controller.add_if_not_added(current_user, movie_name) unless movie_controller.display(movie_name).nil?
      when 'remove'
        user_controller.remove(current_user, movie_name)
    end
  when 'profile'
    action = user_controller.start
    case action
      when 'E'
        exit
      when 'C'
        puts current_user.movies
      when 'L'
        movie_controller.display(current_user.last_movie_added)
      when 'P'
        #should be handeld by users controller#get_profile
        user_controller.profile(current_user)
      when 'G'
        #should be handeled by users controller#favgenre
        puts current_user.get_fav_genre
    end
  end
  "---------------------------"
end
