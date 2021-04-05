require 'rest-client'

response = RestClient.get( 
  'http://localhost:3000/api/v1/contracts', 
  :content_type => :json, :accept => :json, :'x-user-email' => "aurelie.peguet@gmail.com", :'x-user-token' => 'sR3yniZixLsgFbCV2WX-')

puts response
