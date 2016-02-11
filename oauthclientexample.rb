require 'rest-client'
require 'json'

#Beispielaufruf der api mit token

client_id = '41d3864de4fdd3dedd753c0799a9105ea6fad475245ffb587fcc298b207b4d47'
client_secret = '85fdb936953f785f2cf225d4f09c5c1fa0f4a8524e89c937293fe0ad435e0c97'

response = RestClient.post 'http://localhost:3000/oauth/token', {
  grant_type: 'client_credentials',
  client_id: client_id,
  client_secret: client_secret
}
puts "response: #{response}"
token = JSON.parse(response)["access_token"]
puts token
erg = RestClient.get 'http://localhost:3000/customers', { 'Authorization' => "Bearer #{token}" }
puts erg