json.array!(@teams) do |team|
  json.extract! team, :id, :league_id, :name, :image, :description, :total_matches, :total_points
  json.url team_url(team, format: :json)
end
