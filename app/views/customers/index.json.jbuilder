json.array!(@customers) do |customer|
  json.extract! customer, :id, :firstname, :lastname, :age
  json.url customer_url(customer, format: :json)
end
