json.array!(@seasons) do |season|
  json.extract! season, :id, :name, :slug
  json.url season_url(season, format: :json)
end
