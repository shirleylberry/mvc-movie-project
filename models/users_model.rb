require 'pry'

class User
  attr_accessor :name, :movies, :favorite_movie, :email


  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie_by_name(movie)
    @movies << movie #if movie is in movies.all
  end

  def delete_movie_by_name(movie)
    @movies.delete(movie)
  end

  def favorite_movie=(movie)
    @favorite_movie= @movies.find do |movie_name|
                        movie_name==movie
                    end
  end

  def last_movie_added
    @movies.last
  end

  def movie_count
    @movies.count 
  end

  def sort_collection
    @movies.sort 
  end


  danny=User.new("Danny")
  danny.add_movie_by_name("American Beauty")
  danny.add_movie_by_name("Silence of the Lambs")
  danny.favorite_movie=("American Beauty")
  danny.email="danielgilberg@gmail.com"


  binding.pry

  puts "hi"


end