class UserFavoriteView
  def render
    puts "Enter your favorite movie name."
    gets.chomp.capitalize
  end
end