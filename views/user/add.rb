class UserAddView

  def render(movie_name, was_created = "True")
    if was_created == "True"
      puts "Added #{movie_name} to your collection."
    else
      puts "Could not find #{movie_name}."
    end
  end
end