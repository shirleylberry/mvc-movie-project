require "net/http"
require "uri"
require 'pry'

# response = Net::HTTP.get_response("omdbapi.com","/?t=inception&format=json")

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

  def self.find_movie_by_name(user, movie_name)
    movie = current_user.all.find{|movie| movie.name == movie_name}
    movie.nil? ? movie_data = find_movie_data_by_name(movie_name) : movie
  end

  def self.display_movie_data_by_name(movie_name)
    movie = self.find_movie_by_name(movie_name)
    binding.pry
    movie_info = movie.movie_data
    puts movie_info
  end

  def self.display_specific_movie_data_by_name(movie_name, requested_data)
    movie = self.find_movie_by_name(movie_name)
    movie_info = movie.movie_data
    puts "#{movie.name}, #{requested_data}: #{movie_info[requested_data.capitalize.to_sym]}"
  end

  def self.find_movie_data_by_name(movie_name)
    # formatted_name = movie_name.gsub(" ", "+")
    # response = Net::HTTP.get_response("omdbapi.com","/?t=#{movie_name}&format=json")
    # movie_info = eval(response.body)
    # puts "#{movie_info.to_s}: #{movie_info[movie_info.capitalize.to_sym]}"
    # movie_info
    formatted_name = movie_name.gsub(" ", "+")
    response = Net::HTTP.get_response("omdbapi.com","/?t=#{formatted_name}&format=json")
    movie_info = eval(response.body)
    movie_info
  end
end
