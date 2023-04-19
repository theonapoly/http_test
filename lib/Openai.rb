require 'http'
require 'dotenv'
require 'rspec'

Dotenv.load('.env')

def login_openai(url, headers)
response = HTTP.get(url, headers: headers)
return response.body.to_s
end

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/models"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}
