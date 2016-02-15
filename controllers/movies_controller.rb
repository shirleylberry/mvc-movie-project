class MoviesController
  def prompt_movie_name
    puts "\n Great. What movie would you like to act on?"
    gets.chomp
  end

  def lookup(movie_name)
    Movie.display_movie_data_by_name(movie_name)
  end
end