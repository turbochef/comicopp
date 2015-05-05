json.array!(@comics) do |comic|
  json.extract! comic, :id, :title, :description, :user_id
  json.url comic_url(comic, format: :json)
end
