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


# Locate ID key in hash

puts "Enter Product ID and I will find Customer's who ordered it"
ID = gets.chomp
puts "ProductID: #{ID}"

# Make an HTTP request to Order_Details JSON
url = "http://services.odata.org/Northwind/Northwind.svc/Products(" + ID.to_s + ")/Order_Details/?$format=json"
jsonStr = Net::HTTP.get_response(URI.parse(url))
data = jsonStr.body
jsonProductHash = JSON.parse(data)
jsonValueHash = jsonProductHash["value"]

# Make an HTTP request to Customers JSON
num = 0
for index in jsonValueHash
	url2 = "http://services.odata.org/Northwind/Northwind.svc/Orders(#{index["OrderID"]})/Customer?$format=json"
	jsonStr2 = Net::HTTP.get_response(URI.parse(url2))
	data2 = jsonStr2.body
	jsonProductHash2 = JSON.parse(data2)
	puts jsonProductHash2["ContactName"]
	num = num + 1
end
puts "The number of orders for product ID #{ID} is #{num}"


