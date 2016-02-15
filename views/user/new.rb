class UserNewView
  def render
    puts "Now we'll work on your profile."
    puts "View collection(C), view the last movie you added (L), view your profile (P), or find your favorite genre (G)?"
    gets.chomp
  end

end