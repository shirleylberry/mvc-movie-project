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
    let(:movie1) { Movie.new("Star Wars") }
    let(:movie2) { Movie.new("Hackers") }
    it 'adds the movie to the user collection' do 
      user1.add_movie_by_name("Space Jam")
      user1.add_movie_by_name("The Chipmunks Movie")
      expect(user1.movies).to eq(["Space Jam", "The Chipmunks Movie"])
    end
  end
  describe '#delete_movie_by_name' do 
    let(:user1) { User.new("Deniz") }
    let(:movie1) { Movie.new("Frozen") }
    let(:movie2) { Movie.new("The Chipmunks Movie") }
    it 'removes a movie from the user collection' do
      user1.delete_movie_by_name("The Chipmunks Movie")
      expect(user1.movies).not_to include("The Chipmunks Movie")
    end
  end
end