class MoviesController
  def prompt_movie_name
    view = MovieNewView.new 
    view.render
  end

  def lookup(movie_name)
    Movie.display_movie_data_by_name(movie_name)
  end

  def display(movie_name)
    view = MovieDisplayView.new
    movie = Movie.add_or_find_movie_by_name(movie_name)
    # binding.pry
    view.render(movie_name, movie.movie_data)
  end
end