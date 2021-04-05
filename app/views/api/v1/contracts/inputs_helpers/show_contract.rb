require 'rest-client'

response = RestClient.get( 
  'http://localhost:3000/api/v1/contracts/15', 
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')

puts response
