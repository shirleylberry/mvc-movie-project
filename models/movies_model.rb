require "net/http"
require "uri"
require 'pry'

class Movie
  attr_accessor :name, :movie_data, :movie_genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    movie_info = Movie.find_movie_data_by_name(name)   
    if movie_info.nil?
      return nil
    else
      @movie_data = movie_info
    end 
    first_genre = @movie_data.fetch(:Genre).split(", ").first
    genre = Genre.all.find {|genre| genre.name == first_genre}
    genre.nil? ? movie_genre = Genre.new(first_genre) : movie_genre = genre
    movie_genre.add_movie_by_name(name)
    @@all << self
    # binding.pry
  end

  # this is the interface the user model uses to create a new movie
  # it finds a movie by name if it exists in Movie.all already
  # and if it doesn't exist yet it creates a new movie object
  def self.add_or_find_movie_by_name(movie_name)
    movie = self.find_movie_by_name(movie_name)
    movie_data = find_movie_data_by_name(movie_name)
    if movie.nil? && movie_data.fetch(:Response) != "False"
      movie = Movie.new(movie_name)
    elsif movie_data.fetch(:Response) == "False"
      puts "That movie could not be found."
    else
      movie
    end
  end

  def self.find_movie_data_by_name(movie_name)
    formatted_name = movie_name.gsub(" ", "+")
    response = Net::HTTP.get_response("omdbapi.com","/?t=#{formatted_name}&format=json")
    movie_info = eval(response.body)
    movie_info
  end

  # checks if the movie is already in the @@all array
  # if it isn't, returns nil which tells add_or_find_movie_by_name to create a new movie
  def self.find_movie_by_name(movie_name)
    movie = self.all.find do |movie| 
      movie.name == movie_name
    end
    movie.nil? ? nil : movie
  end

  def self.display_movie_data_by_name(movie_name)
    movie = self.add_or_find_movie_by_name(movie_name)
    movie_info = movie.movie_data
    puts movie_info
  end
end
