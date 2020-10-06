require 'httparty'
require 'prettyprint'

KEY = "pk.98eaa1e1e5840cf64db19b17bab0fe2a"
BASE_URL = "https://us1.locationiq.com/v1/search.php"

response = HTTParty.get(BASE_URL, query: {
    q: "",
    key: KEY,
    format: 'json'
}
)
seven_wonders = ["Great Pyramid of Giza", "Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

locations = []
if response.code == 200
seven_wonders.each do |wonder|
  location = {
      wonder => {
    "lat" => "#{response.first["lat"]}",
    "lon" => "#{response.first["lon"]}"
}
  }
sleep(0.5)
  locations << location
end
end

pp locations