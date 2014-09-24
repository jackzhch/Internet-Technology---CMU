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

puts "Enter Product ID:"
ID = gets.chomp
puts "ProductID: #{ID}"

# Make an HTTP request to Product JSON
url = "http://services.odata.org/Northwind/Northwind.svc/Products(" + ID.to_s + ")/Order_Details/?$format=json"
jsonStr = Net::HTTP.get_response(URI.parse(url))
data = jsonStr.body
jsonProductHash = JSON.parse(data)
jsonValueHash = jsonProductHash["value"]

puts "Order ID's    Total Price after discount"

num = 0
for index in jsonValueHash
		puts "#{index["OrderID"]}           #{index["UnitPrice"].to_f * index["Quantity"].to_i * (1-index["Discount"].to_f)} "
		num = num + 1	
end
puts "The number of orders for product ID #{ID} is #{num}"


