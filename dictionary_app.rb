require "http"

system "clear"
puts "Welcome to the dictionary app!"
puts "Write a word:"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=b05bbefa71250039e60030a86260994d095206c2efdc555ad")

# if text key is missing, increment number 
definition = response.parse[0]["text"].downcase
puts "The definition of #{word} is #{definition}"

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=b05bbefa71250039e60030a86260994d095206c2efdc555ad")

pronunciation = response.parse[0]["raw"]
puts "The pronunciation of #{word} is #{pronunciation}"

