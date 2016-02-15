json.array!(@teams) do |team|
  json.extract! team, :id, :name, :image, :description
  json.url team_url(team, format: :json)
end
