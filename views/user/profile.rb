class UserProfileView
  def render(current_user)
    puts "Name: #{current_user.name}"
    puts "Favorite Movie: #{current_user.favorite_movie}"
    puts "Favorite Genre: #{current_user.get_fav_genre}"
    puts "Movie Count: #{current_user.movies.size}"
  end
end