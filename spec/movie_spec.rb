require 'spec_helper.rb'

describe Movie do 
  describe '#initialize' do 
    let(:movie) { Movie.new("Space Jam") }
    it 'initializes the movie with a name' do 
      expect(movie.name).to eq("Space Jam")
    end
    it 'adds the movie to the @@all array' do 
      expect(Movie.all).to include(:movie)
    end
  end
  describe '.find_movie_by_name' do 
    let(:movie) { Movie.new("Space Jam") }
    it 'finds a movie by name' do 
      expect(Movie.find_movie_by_name("Space Jam")).to eq(movie)
    end
  end
end