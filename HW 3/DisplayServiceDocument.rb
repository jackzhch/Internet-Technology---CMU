# This programs demonstrates how Ruby may be used to parse JSON strings.
# Ruby represents the JSON object as a hash.

require 'net/http'
require 'json'

# Go out to the internet and collect some JSON

# Set up the URL

url = "http://services.odata.org/Northwind/Northwind.svc/?$format=json"

# Make an HTTP request and place the result in jsonStr

jsonStr = Net::HTTP.get_response(URI.parse(url))

data = jsonStr.body

jsonHash = JSON.parse(data)


# Locate name key in hash

jsonValueHash = jsonHash["value"]

for index in jsonValueHash
	puts index["name"]
end