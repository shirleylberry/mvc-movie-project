class UserController

  def start
    puts "Now we'll work on your profile."
    puts "View collection(C), view the last movie you added (L), view your profile (P), or find your favorite genre (G)?"
    action = gets.chomp
  end


  def add(current_user, movie_name)
    current_user.add_movie_by_name(movie_name)
    view=UserAddView.new
    view.render(movie_name)
  end

  def remove(current_user, movie_name)
    current_user.delete_movie_by_name(movie_name)
    view=UserRemoveView.new
    view.render(movie_name)
  end


end