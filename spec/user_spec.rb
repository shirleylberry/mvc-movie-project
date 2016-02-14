require_relative '../config/environment.rb'
require 'spec_helper.rb'

describe User do 
  describe '#initialize' do 
    let(:user1) { User.new("Jeff") }

    it 'initializes the user with a name' do 
      expect(user1.name).to eq("Jeff")
    end
  end
end