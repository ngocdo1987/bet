class AssignTeam < ActiveRecord::Base
  belongs_to :league
  belongs_to :season
  belongs_to :team
  
  def self.update_master(league_id, season_id, new_team_ids, old_team_ids)
    ActiveRecord::Base.transaction do
      # 1/ Add new to assign
      new_team_ids.each do |new_team_id|
        self.find_or_create_by(league_id: league_id, season_id: season_id, team_id: new_team_id)
      end
      
      # 2/ Delete old from assign
      old_team_ids.each do |old_team_id|
        unless new_team_ids.include?(old_team_id)
          #print current_team_id
          self.find_by(league_id: league_id, season_id: season_id, team_id: old_team_id).destroy
          #debug assign_team
        end
      end  
    end
  end
end