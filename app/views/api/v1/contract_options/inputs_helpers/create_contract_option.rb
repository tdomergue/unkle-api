require 'rest-client'
require 'json'

response = RestClient.post( 
  'http://localhost:3000/api/v1/contract_options', 
  JSON.generate({ "contract_option": { "contract_id": "15", "option_id": "2" } }),
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')

puts response
