require 'spec_helper.rb'

describe Movie do 
  describe '#initialize' do 
    let(:movie) { Movie.new("Space Jam") }

    it 'initializes the movie with a name' do 
      expect(movie.name).to eq("Space Jam")
    end
  end
end