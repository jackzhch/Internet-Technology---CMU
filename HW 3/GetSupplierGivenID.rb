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

url = "http://services.odata.org/Northwind/Northwind.svc/Products(#{ID})?$format=json"
jsonStr = Net::HTTP.get_response(URI.parse(url))
data = jsonStr.body
jsonProductHash = JSON.parse(data)

puts "Product Name: #{jsonProductHash["ProductName"]}"
puts "Supplier ID: #{jsonProductHash["SupplierID"]}"
puts "Active/Discontinued"

if (jsonProductHash["Discontinued"]) 
      puts jsonProductHash["ProductName"].to_s + " is a discontinued product"
   else 
      puts jsonProductHash["ProductName"].to_s + " is an active product"   
end

# Make an HTTP request to Supplier JSON

url = "http://services.odata.org/Northwind/Northwind.svc/Suppliers(#{jsonProductHash["SupplierID"]})?$format=json"
jsonStr = Net::HTTP.get_response(URI.parse(url))
data = jsonStr.body
jsonProductHash = JSON.parse(data)
puts "Supplier name: #{jsonProductHash["CompanyName"]}"

