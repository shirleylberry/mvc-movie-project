require "net/http"
require "uri"

response = Net::HTTP.get_response("omdbapi.com","/?t=inception&format=json")
puts response.body
