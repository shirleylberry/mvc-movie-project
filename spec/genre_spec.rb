require_relative '../config/environment.rb'
require 'spec_helper.rb'

describe Genre do 
  describe '#initialize' do 
    let(:genre1) { Genre.new("Comedy") }
    it 'initializes the genre with a name' do 
      expect(genre1.name).to eq("Comedy")
    end
    it 'initializes the genre with an empty movie list' do 
      expect(genre1.movies).to eq([])
    end
  end
  describe '#add_movie_by_name' do 
    let(:genre1) { Genre.new("Sci-Fi") }
    let(:movie1) { Movie.new("Star Wars") }
    let(:movie2) { Movie.new("The Martian") }
    it 'adds the movie to the correct Genre' do 
      genre1.add_movie_by_name("Space Jam")
      genre1.add_movie_by_name("The Martian")
      expect(genre1.movies).to include("Space Jam")
      expect(genre1.movies).to include("The Martian")
      expect(genre1.movies.size).to eq(2)
    end
  end
  describe '#delete_movie_by_name' do 
    let(:genre1) { Genre.new("Animation") }
    let(:movie1) { Movie.new("Frozen") }
    let(:movie2) { Movie.new("Finding Nemo") }
    it 'removes a movie from the genre list' do
      genre1.add_movie_by_name("Frozen")
      genre1.add_movie_by_name("Finding Nemo")
      genre1.delete_movie_by_name("Finding Nemo")
      expect(genre1.movies).not_to include("Finding Nemo")
      expect(genre1.movies.size).to eq(1)
    end
  end
  describe '#get_genre_percentage' do 
    let(:genre1) { Genre.new("Animation") }
    let(:user1) {User.new("Ian")}
    let(:movie1) { Movie.new("Frozen") }
    let(:movie2) { Movie.new("Finding Nemo") }
    it 'calculates genre percentage for user given genre' do
      genre1.add_movie_by_name("Frozen")
      genre1.add_movie_by_name("Finding Nemo")
      user1.add_movie_by_name("Frozen")
      user1.add_movie_by_name("The Martian")
      user1.add_movie_by_name("Finding Nemo")
      expect(genre1.get_genre_percentage(user1.movies)).to eq(67)
    end
  end
end