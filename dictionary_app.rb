require "http"

while true
  system "clear"
  puts "Welcome to the dictionary app!"
  puts "Write a word:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e")

  # if text key is missing, increment number 
  definition = response.parse[0]["text"].downcase
  puts "The definition of #{word} is #{definition}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=48dd829661f515d5abc0d03197a00582e888cc7da2484d5c7")

  pronunciation = response.parse[0]["raw"]
  puts "The pronunciation of #{word} is #{pronunciation}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930")

  top_example = response.parse["text"]
  puts "The top example of #{word} is #{top_example}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=8dba4744d147470de953d228e1788d494480af9c8a004769a")

  file_url = response.parse[0]["fileUrl"]
  system("open", file_url)

  puts "Enter q to quit, or any other key to continue"
  user_input = gets.chomp
  if user_input == "q"
    puts "Thank you, goodbye!"
    break
  end
end
