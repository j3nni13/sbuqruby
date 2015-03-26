json.array!(@venuetypes) do |venuetype|
  json.extract! venuetype, :id, :name
  json.url venuetype_url(venuetype, format: :json)
end
