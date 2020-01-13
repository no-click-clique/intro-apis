require "http"

system "clear"
puts "Welcome to the Weather App!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=9beb296210c3171be00be7e99d0e7ba8")

temperature = response.parse["main"]["temp"]
description = response.parse["weather"][0]["description"]

puts "The weather in #{city} is #{temperature} right now with #{description}."