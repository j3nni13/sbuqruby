json.array!(@receptions) do |reception|
  json.extract! reception, :id
  json.url reception_url(reception, format: :json)
end
