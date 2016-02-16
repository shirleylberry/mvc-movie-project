require 'pry'

class User
  attr_accessor :name, :movies, :favorite_movie, :email


  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie_by_name(movie_name)
    movie = Movie.add_or_find_movie_by_name(movie_name)
    self.movies << movie.name unless movie.nil?
  end

  def delete_movie_by_name(movie)
    self.movies.delete(movie)
  end

  def favorite_movie=(movie)
    @favorite_movie= self.movies.find do |movie_name|
      movie_name==movie
    end
  end

  def last_movie_added
    self.movies.last
  end

  def movie_count
    self.movies.count 
  end

  def sort_collection
    self.movies.sort 
  end

  def get_fav_genre
    genre_percents = Genre.all.each_with_object({}) do |genre, genre_w_percents|
      genre_w_percents[genre] = genre.get_genre_percentage(movies)
    end
    sorted_genres = genre_percents.sort_by {|key, value| value}
    sorted_genres.last.first.name
  end

  def view_profile
    puts "Name: #{self.name}"
    puts "Favorite Movie: #{self.favorite_movie}"
    puts "Favorite Genre: #{self.get_fav_genre}"
    puts "Movie Count: #{self.movies.size}"
  end


  # danny=User.new("Danny")
  # danny.add_movie_by_name("American Beauty")
  # danny.add_movie_by_name("Silence of the Lambs")
  # danny.favorite_movie=("American Beauty")
  # danny.email="danielgilberg@gmail.com"

  # binding.pry


end