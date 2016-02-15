class MovieDisplayView
    def render(movie_name, movie_data)
      # binding.pry
      puts "Info about #{movie_name}:"
      movie_data.each{|key, value| puts "#{key.upcase}: #{value}"}
    end
end