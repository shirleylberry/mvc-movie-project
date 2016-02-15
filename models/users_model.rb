class User
  attr_accessor :name, :movies

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie_by_name(movie)
    @movies << "#{movie}" #if movie is in movies.all
  end

  def delete_movie_by_name(movie)
    @movies.delete(movie)
  end
end