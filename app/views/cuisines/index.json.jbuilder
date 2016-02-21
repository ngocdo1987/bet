json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :name, :slug, :description
  json.url cuisine_url(cuisine, format: :json)
end
