require_relative '../config/environment.rb'
require 'spec_helper.rb'

describe User do 
  describe '#initialize' do 
    let(:user1) { User.new("Jeff") }
    it 'initializes the user with a name' do 
      expect(user1.name).to eq("Jeff")
    end
    it 'initializes the user with an empty movie collection' do 
      expect(user1.movies).to eq([])
    end
  end
  describe '#add_movie_by_name' do 
    let(:user1) { User.new("Ian") }
    let(:movie1) { Movie.new("Princess Diaries") }
    let(:movie2) { Movie.new("Clerks") }
    it 'adds the movie to the user collection' do 
      user1.add_movie_by_name("Princess Diaries")
      user1.add_movie_by_name("Clerks")
      expect(user1.movies).to include(movie1)
      expect(user1.movies).to include(movie2)
      expect(user1.movies.size).to eq(2)
    end
  end
  describe '#delete_movie_by_name' do 
    let(:user1) { User.new("Deniz") }
    let(:movie1) { Movie.new("Frozen") }
    let(:movie2) { Movie.new("Hackers") }
    it 'removes a movie from the user collection' do
      user1.add_movie_by_name("Frozen")
      user1.add_movie_by_name("Hackers")
      user1.delete_movie_by_name("Hackers")
      expect(user1.movies).not_to include("Hackers")
      expect(user1.movies.size).to eq(1)
    end
  end
end