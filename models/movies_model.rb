require "net/http"
require "uri"
require 'pry'

# response = Net::HTTP.get_response("omdbapi.com","/?t=inception&format=json")

class Movie
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def find_movie_by_name(movie_name)
  end

  def self.display_movie_data_by_name(movie_name)
    response = Net::HTTP.get_response("omdbapi.com","/?t=#{movie_name}&format=json")
    movie_info = eval(response.body)
  end

  def self.find_specific_movie_data_by_name(movie_name, movie_info)
    response = Net::HTTP.get_response("omdbapi.com","/?t=#{movie_name}&format=json")
    movie_info = eval(response.body)
    movie_info[movie_info.capitaize.to_sym]
  end
end
