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
end