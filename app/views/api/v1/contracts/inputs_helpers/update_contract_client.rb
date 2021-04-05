require 'rest-client'
require 'json'

response = RestClient.patch( 
  'http://localhost:3000/api/v1/contracts/15', 
  JSON.generate({ "contract": { "end_date": "19/07/2001" } }),
  :content_type => :json, :accept => :json, :'x-user-email' => "aurelie.peguet@gmail.com", :'x-user-token' => 'sR3yniZixLsgFbCV2WX-')

puts response
