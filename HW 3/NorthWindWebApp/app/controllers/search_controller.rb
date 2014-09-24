class SearchController < ApplicationController
  require 'net/http'
  require 'json'

# Go out to the internet and collect some JSON

# Set up the URL

  @url = "http://services.odata.org/Northwind/Northwind.svc/?$format=json"

# Make an HTTP request and place the result in jsonStr

  @jsonStr = Net::HTTP.get_response(URI.parse(@url))

  @data = @jsonStr.body

  @jsonHash = JSON.parse(@data)


  def hello
  end


  def GetSupplierGivenID
    puts params["ProductID"]
    @ID =  params["ProductID"]

# Make an HTTP request to Product JSON

    url = "http://services.odata.org/Northwind/Northwind.svc/Products(#{@ID})?$format=json"
    jsonStr = Net::HTTP.get_response(URI.parse(url))
    data = jsonStr.body
    jsonProductHash = JSON.parse(data)

    @ProductName = jsonProductHash["ProductName"]
    @SupplierID = jsonProductHash["SupplierID"]
    #@Status = "Active/Discontinued"

    if (jsonProductHash["Discontinued"])
      @Status = jsonProductHash["ProductName"].to_s + " is a discontinued product"
    else
      @Status = jsonProductHash["ProductName"].to_s + " is an active product"
    end

# Make an HTTP request to Supplier JSON

    url = "http://services.odata.org/Northwind/Northwind.svc/Suppliers(#{jsonProductHash["SupplierID"]})?$format=json"
    jsonStr = Net::HTTP.get_response(URI.parse(url))
    data = jsonStr.body
    jsonProductHash = JSON.parse(data)
    @SupplierName = jsonProductHash["CompanyName"]

  end

  def GivenProductIDListOrders

    @ID =  params["ProductID"]
# Make an HTTP request to Product JSON
    url = "http://services.odata.org/Northwind/Northwind.svc/Products(" + @ID.to_s + ")/Order_Details/?$format=json"
    jsonStr = Net::HTTP.get_response(URI.parse(url))
    data = jsonStr.body
    jsonProductHash = JSON.parse(data)
    @jsonValueHash = jsonProductHash["value"]

  end

  def GivenProductIDListCustomerContactNames
    @ID =  params["ProductID"]
# Make an HTTP request to Product JSON
    url = "http://services.odata.org/Northwind/Northwind.svc/Products(" + @ID.to_s + ")/Order_Details/?$format=json"
    jsonStr = Net::HTTP.get_response(URI.parse(url))
    data = jsonStr.body
    jsonProductHash = JSON.parse(data)
    @jsonValueHash = jsonProductHash["value"]

    @num = 0
    @a=[]
    @jsonValueHash.each do |k|
      url2 = "http://services.odata.org/Northwind/Northwind.svc/Orders(#{k["OrderID"]})/Customer?$format=json"
      jsonStr2 = Net::HTTP.get_response(URI.parse(url2))
      data2 = jsonStr2.body
      @jsonProductHash2 = JSON.parse(data2)
      @num = @num + 1
      @a.push("#{@jsonProductHash2["ContactName"]}")
    end

  end
end
