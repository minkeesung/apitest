# require 'open-uri'
# require 'pry'
# require 'json'
#
# res = open('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=lodging&key=AIzaSyDrn3byZcNDhSkFlrm2Ep6TcA_42WjZowg')
#
# res = open('https://www.googleapis.com/qpxExpress/v1/trips/search?&key=AIzaSyAJY-rXJPq6VkKL7eVWOMij3QljB674HP8')
# api_key = 'AIzaSyAJY-rXJPq6VkKL7eVWOMij3QljB674HP8'
# puts res
# a = JSON.parse(res.read)
# binding.pry
#
#
# p 'hello'
require 'pry'
require 'json'
require 'rest-client'
response = RestClient.post 'https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyAaLHEBBLCI4aHLNu2jHiiAQGDbCunBQX0',
             {
               request: {
                 passengers: {
                   adultCount: 1
                 },
                 slice: [
                   {
                     origin: "BOS",
                     maxStops: 0,
                     destination: "LAX",
                     date: "2017-10-14"
                   },
                   {
                     origin: "LAX",
                     maxStops: 0, 
                     destination: "BOS",
                     date: "2017-11-14"
                   }
                 ]
               }
             }.to_json,
             :content_type => :json
a = response.body
binding.pry
puts response.body
