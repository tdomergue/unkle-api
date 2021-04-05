require 'rest-client'
require 'json'

response = RestClient.delete( 
  'http://localhost:3000/api/v1/users/24', 
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')

puts response
