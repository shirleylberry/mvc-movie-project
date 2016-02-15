class Genre
  attr_accessor :name, :movies
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @movies = []
    @@all << self
  end

  def add_movie_by_name(movie)
    @movies << "#{movie}" 
  end

  def delete_movie_by_name(movie)
    @movies.delete(movie)
  end

  def get_genre_percentage(user_movie_list)
    genre_count = user_movie_list.select do |movie|
      movies.include?(movie)
    end.size
    (genre_count.to_f * 100/ user_movie_list.size).round
  end
end