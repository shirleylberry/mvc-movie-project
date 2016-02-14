require 'spec_helper.rb'

describe Movie do 
  describe '#initialize' do 
    let(:movie) { User.new("Space Jam") }

    it 'initializes the movie with a name' do 
      expect(user1.name).to eq("Space Jam")
    end
  end
end