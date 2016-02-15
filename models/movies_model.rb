require "net/http"
require "uri"
require 'pry'

class Movie
  attr_accessor :name, :movie_data

  @@all = Hash.new

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    movie_info = Movie.find_movie_data_by_name(name)
    return nil if movie_info.nil?
 
    @movie_data =  movie_info
    @@all[movie_info.fetch(:Title)] = movie_info
  end

  # this is the interface the user model uses to create a new movie
  # it finds a movie by name if it exists in Movie.all already
  # and if it doesn't exist yet it creates a new movie object
  def self.add_or_find_movie_by_name(movie_name)
    self.find_movie_by_name(movie_name).nil? ? movie = Movie.new(movie_name) : movie
  end

  def self.find_movie_data_by_name(movie_name)
    formatted_name = movie_name.gsub(" ", "+")
    response = Net::HTTP.get_response("omdbapi.com","/?t=#{formatted_name}&format=json")
    movie_info = eval(response.body)
  end

  def self.find_movie_by_name(movie_name)
    movie = self.all.find{|name, data| name == movie_name}
    movie.nil? ? nil : movie
  end

  def self.display_movie_data_by_name(movie_name)
    movie = self.add_or_find_movie_by_name(movie_name)
    movie_info = movie.movie_data
    puts movie_info
  end
end
