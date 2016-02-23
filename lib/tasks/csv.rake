namespace :db do
  desc "Autogenerate football data"  
  task :csv => :environment do
    require 'csv'
    
    season_name = '1895-96'
    league_name = 'Division 1'
    soccer_path = 'eng-england/1890s/'+season_name+'/1-division1.csv'
    #matches = CSV.read('public/csv/' + soccer_path)
    
    season = Season.find_or_create_by(
      name: season_name,
      slug: season_name
    )
    puts "Generate season finished!"
    puts "Season id: #{season.id}"
    
    league = League.find_or_create_by(
      league_name: league_name,
      league_type: 'Football',
      active: true
    )
    puts "Generate league finished!"
    puts "Season id: #{league.id}"
    
    CSV.foreach('public/csv/' + soccer_path) do |row|
      home_team = row[2]
      away_team = row[3]
      
      
      if home_team != 'Team 1'
        hteam = Team.find_or_create_by(
          name: home_team
        )
        
        ateam = Team.find_or_create_by(
          name: away_team  
        )
      
        vs = row[4]
        vs = vs.split("-")
        
        home_score = vs[0]
        away_score = vs[1]
        
        m = Match.create!(
          league_id: league.id,
          season_id: season.id,
          home_team_id: hteam.id,
          away_team_id: ateam.id,
          home_team: home_team,
          away_team: away_team,
          home_number: 0,
          away_number: 0,
          home_score: home_score,
          away_score: away_score
        )
        
        puts home_team + " - " + away_team + " // " + home_score + " : " + away_score
        #puts vs.inspect
      end  
    end
  end
end