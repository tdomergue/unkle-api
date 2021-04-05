require 'rest-client'
require 'json'

response = RestClient.patch( 
  'http://localhost:3000/api/v1/contracts/17', 
  JSON.generate({ "contract": { "start_date": "19/08/2021" } }),
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')

puts response
