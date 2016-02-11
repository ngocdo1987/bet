json.array!(@matches) do |match|
  json.extract! match, :id, :league_id, :home_team, :away_team, :home_number, :away_number, :match_time, :active, :home_score, :away_score, :calculated
  json.url match_url(match, format: :json)
end
