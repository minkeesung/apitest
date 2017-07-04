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
b = JSON.parse(a)
binding.pry
puts a

 saletotal = b["trips"]["tripOption"][0]["saleTotal"]
 carrier = b["trips"]["tripOption"][0]["slice"][0]["segment"][0]["flight"]["carrier"]
 arrival_time_ = b["trips"]["tripOption"][0]["slice"][0]["segment"][0]["leg"][0]["arrivalTime"]
 # 0 after leg needs to stay 0
 departureTime_when_leaving = b["trips"]["tripOption"][0]["slice"][0]["segment"][0]["leg"][0]["departureTime"]
 # 0 after leg needs to stay 0
 origin =  b["trips"]["tripOption"][0]["slice"][0]["segment"][0]["leg"][0]["origin"]
 destination =  b["trips"]["tripOption"][0]["slice"][0]["segment"][0]["leg"][0]["destination"]

{"kind"=>"qpxexpress#tripOption",
 # "saleTotal"=>"USD308.40",
 "id"=>"RXzlTgyjc2UMUtvTValVmV001",
 "slice"=>
  [{"kind"=>"qpxexpress#sliceInfo",
    "duration"=>380,
    "segment"=>
     [{"kind"=>"qpxexpress#segmentInfo",
       "duration"=>380,
      #  "flight"=>{"carrier"=>"UA", "number"=>"1896"},
       "id"=>"G1ugjE9ynwUUbQUp",
       "cabin"=>"COACH",
       "bookingCode"=>"N",
       "bookingCodeCount"=>9,
       "marriedSegmentGroup"=>"0",
       "leg"=>
        [{"kind"=>"qpxexpress#legInfo",
          "id"=>"LJAByIRPloyXuulw",
          "aircraft"=>"739",
          # "arrivalTime"=>"2017-10-14T10:10-07:00",
          # "departureTime"=>"2017-10-14T06:50-04:00",
          # "origin"=>"BOS",
          # "destination"=>"LAX",
          "originTerminal"=>"B",
          "origin"=>"BOS",
          "destination"=>"LAX",
          "originTerminal"=>"B",
          "destinationTerminal"=>"7",
          "duration"=>380,
          "onTimePerformance"=>90,
          "mileage"=>2604,
          "meal"=>"Food for Purchase",
          "secure"=>true}]}]},
   {"kind"=>"qpxexpress#sliceInfo",
    "duration"=>323,
    "segment"=>
     [{"kind"=>"qpxexpress#segmentInfo",
       "duration"=>323,
       "flight"=>{"carrier"=>"UA", "number"=>"824"},
       "id"=>"GLuTXpFWDqVPosBs",
       "cabin"=>"COACH",
       "bookingCode"=>"N",
       "bookingCodeCount"=>9,
       "marriedSegmentGroup"=>"1",
       "leg"=>
        [{"kind"=>"qpxexpress#legInfo",
          "id"=>"L1klL+IoA+Y6lTRL",
          "aircraft"=>"738",
          "arrivalTime"=>"2017-11-14T17:08-05:00",
          "departureTime"=>"2017-11-14T08:45-08:00",
          "origin"=>"LAX",
          "destination"=>"BOS",
          "originTerminal"=>"7",
          "destinationTerminal"=>"B",
          "duration"=>323,
          "onTimePerformance"=>60,
          "mileage"=>2604,
          "meal"=>"Food for Purchase",
          "secure"=>true}]}]}],
 "pricing"=>
  [{"kind"=>"qpxexpress#pricingInfo",
    "fare"=>
     [{"kind"=>"qpxexpress#fareInfo", "id"=>"AkntzAKr+pdL+8l1Lr/GmF2QpgBoqVn+whetP5oxr+cs", "carrier"=>"UA", "origin"=>"BOS", "destination"=>"LAX", "basisCode"=>"KAA4AHBN"},
      {"kind"=>"qpxexpress#fareInfo", "id"=>"AkntzAKr+pdL+8l1Lr/GmF2QpgBoqVn+whetP5oxr+cs", "carrier"=>"UA", "origin"=>"LAX", "destination"=>"BOS", "basisCode"=>"KAA4AHBN"}],
    "segmentPricing"=>
     [{"kind"=>"qpxexpress#segmentPricing", "fareId"=>"AkntzAKr+pdL+8l1Lr/GmF2QpgBoqVn+whetP5oxr+cs", "segmentId"=>"G1ugjE9ynwUUbQUp"},
      {"kind"=>"qpxexpress#segmentPricing", "fareId"=>"AkntzAKr+pdL+8l1Lr/GmF2QpgBoqVn+whetP5oxr+cs", "segmentId"=>"GLuTXpFWDqVPosBs"}],
    "baseFareTotal"=>"USD260.46",
    "saleFareTotal"=>"USD260.46",
    "saleTaxTotal"=>"USD47.94",
    "saleTotal"=>"USD308.40",
    "passengers"=>{"kind"=>"qpxexpress#passengerCounts", "adultCount"=>1},
    "tax"=>
     [{"kind"=>"qpxexpress#taxInfo", "id"=>"US_001", "chargeType"=>"GOVERNMENT", "code"=>"US", "country"=>"US", "salePrice"=>"USD19.54"},
      {"kind"=>"qpxexpress#taxInfo", "id"=>"AY_001", "chargeType"=>"GOVERNMENT", "code"=>"AY", "country"=>"US", "salePrice"=>"USD11.20"},
      {"kind"=>"qpxexpress#taxInfo", "id"=>"XF", "chargeType"=>"GOVERNMENT", "code"=>"XF", "country"=>"US", "salePrice"=>"USD9.00"},
      {"kind"=>"qpxexpress#taxInfo", "id"=>"ZP", "chargeType"=>"GOVERNMENT", "code"=>"ZP", "country"=>"US", "salePrice"=>"USD8.20"}]
