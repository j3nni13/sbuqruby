json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :price, :description
  json.url listing_url(listing, format: :json)
end
