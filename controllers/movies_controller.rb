class MoviesController
  def start
    puts "\nWhat action would you like to take?"
    puts "Your options are: add, remove, lookup, and exit"
    action = gets.chomp
  end

  def prompt_movie_name
    view = MovieNewView.new 
    view.render
  end

  def lookup(movie_name)
    Movie.display_movie_data_by_name(movie_name)
  end

  def display(movie_name)

    movie = Movie.add_or_find_movie_by_name(movie_name)
    # binding.pry
    return if movie.nil?
    @movie_data = movie.movie_data
    @movie_name = movie_name
    render("movie/display") unless movie.nil?
  end

  def render(file)
    file_name = "views/templates/#{file}.html.erb"
    file_contents = File.read(file_name)
    template = ERB.new(file_contents)
    formatted_file_contents = template.result(binding)
    # binding.pry
    output_file = "views/output/#{file}.html"
    new_file = File.write(output_file, formatted_file_contents)
    `open -a 'Google Chrome' #{output_file}`
  end
end