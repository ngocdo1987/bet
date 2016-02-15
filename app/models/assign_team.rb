class AssignTeam < ActiveRecord::Base
  belongs_to :league
  belongs_to :season
  belongs_to :team
end