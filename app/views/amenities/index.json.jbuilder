json.array!(@amenities) do |amenity|
  json.extract! amenity, :id
  json.url amenity_url(amenity, format: :json)
end
