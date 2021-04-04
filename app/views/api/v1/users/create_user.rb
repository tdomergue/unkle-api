require 'rest-client'
require 'json'

response = RestClient.post( 
  'http://localhost:3000/api/v1/users', 
  JSON.generate({"user": { "email": "thibdom@hotmail.com", "first_name": "b", "last_name": "b", "admin": "true" }}),
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')
