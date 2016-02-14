class User
  attr_accessor :name, :movies

  def initialize(name)
    @name = name
    @movies = []
  end
end