class UserPromptView
  def render(movie_name)
    puts "#{movie_name} is not in your collection. Would you like to add it? (Y/N)"
    gets.chomp
  end
end