require 'spec_helper.rb'

describe Movie do 
  describe '.add_or_find_movie_by_name, the public interface to #initialize,' do 
    let(:movie) { Movie.add_or_find_movie_by_name("Sleeping Beauty") }
    it 'initializes the movie with a name' do 
      expect(movie.name).to eq("Sleeping Beauty")
    end
    it 'adds the movie to the @@all array' do 
      # binding.pry
      expect(Movie.all).to include(movie)
    end
    it 'gives the movie a movie_data hash' do
      movie_genre = movie.movie_data[:Genre]
      expect(movie.movie_data.keys).to include(:Genre)
      expect(movie.movie_data.keys).to include(:Title)
      expect(movie.movie_data.keys).to include(:Year)
      expect(movie.movie_data.fetch(:Title)).to eq("Sleeping Beauty")
    end
  end
  
  describe '.find_movie_by_name' do
    let(:movie1) { Movie.add_or_find_movie_by_name("Air Bud") }
    let(:movie2) { Movie.add_or_find_movie_by_name("Frozen") }
    it 'finds a movie by name' do 
      Movie.all.clear
      air_bud_movie = movie1
      frozen_movie = movie2
      # binding.pry
      expect(Movie.find_movie_by_name("Air Bud")).to eq(air_bud_movie)
      expect(Movie.find_movie_by_name("Frozen")).to eq(frozen_movie)
    end
    it 'returns nil if the movie has not been created yet' do
      expect(Movie.find_movie_by_name("Titanic")).to eq(nil)
    end
  end
end
