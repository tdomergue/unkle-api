require 'rest-client'

response = RestClient.get( 
  'http://localhost:3000/api/v1/users/24', 
  :content_type => :json, :accept => :json, :'x-user-email' => "thibdom@hotmail.com", :'x-user-token' => 'xnnusF7_WyeyDavsvMVL')

puts response
