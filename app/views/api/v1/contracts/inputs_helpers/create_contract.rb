require 'rest-client'
require 'json'

response = RestClient.post( 
  'http://localhost:3000/api/v1/contracts', 
  JSON.generate({
    "contract": { "number": "3628738298", "start_date": "19/06/1991", "end_date": "19/06/2031" },
    "subscription": { "user_id": "2" }
  }),
  :content_type => :json, :accept => :json, :'x-user-email' => "thibaud.domergue@hei.fr", :'x-user-token' => 'Po57BBj2mGzfT8YQB4gy')

puts response
