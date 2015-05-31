json.array!(@alcohols) do |alcohol|
  json.extract! alcohol, :id
  json.url alcohol_url(alcohol, format: :json)
end
