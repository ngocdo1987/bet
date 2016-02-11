json.array!(@leagues) do |league|
  json.extract! league, :id, :league_name, :league_image, :league_type, :active
  json.url league_url(league, format: :json)
end
