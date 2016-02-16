class UserController

  def start
    puts "Now we'll work on your profile."
    puts "View collection(C), view the last movie you added (L), view your profile (P), find your favorite genre (G) or exit(E)?"
    action = gets.chomp
  end

  def new_user
    view = UserCreateView.new
    user_name = view.render
    current_user = User.new(user_name)
    view = UserWelcomeView.new
    view.render(current_user)
    current_user
  end

  def add(current_user, movie_name)
    collection = current_user.add_movie_by_name(movie_name)
    # binding.pry
    return if collection.nil?
    view=UserAddView.new
    view.render(movie_name)
  end

  def remove(current_user, movie_name)
    current_user.delete_movie_by_name(movie_name)
    view=UserRemoveView.new
    view.render(movie_name)
  end

  def profile(current_user)
    view = UserProfileView.new
    view.render(current_user)
  end

  def add_if_not_added(current_user, movie_name)
    return nil if current_user.movies.include?(movie_name)
    view = UserPromptView.new
    should_add = view.render(movie_name)
    should_add == "Y" ? add(current_user, movie_name) : puts("#{movie_name} was not added to your collection.")
  end


end