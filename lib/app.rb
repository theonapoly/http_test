# ligne très importante qui appelle les gems.
require 'http'
require 'dotenv'
Dotenv.load('../.env')
# n'oublie pas les lignes pour Dotenv ici…

# création de la clé d'api et indication de l'url utilisée.
api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

# un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}
puts ENV["OPENAI_API_KEY"]

# un peu de json pour envoyer des informations directement à l'API
data = {
  "prompt" => "Donne moi le noms de 5 montagnes différentes :",
  "max_tokens" => 20,
  "n"=> 2,
  "temperature" => 0.6
}

# une partie un peu plus complexe :
# - cela permet d'envoyer les informations en json à ton url
# - puis de récupéré la réponse puis de séléctionner spécifiquement le texte rendu
response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

# ligne qui permet d'envoyer l'information sur ton terminal
puts "Donne moi le noms de 5 montagnes différentes :"
puts response_string
