class Match < ActiveRecord::Base
    belongs_to :league
    has_many :odd_spreads
    has_many :odd_money_lines
    has_many :odd_total_points
    
    validates :league_id, presence: true
    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :home_number, presence: true
    validates :away_number, presence: true
    
    def self.all_filters
        return {
            home_team: 'LIKE', 
            away_team: 'LIKE',
            league_id: '=',
            active: '='
        } 
    end    
end