class Match < ActiveRecord::Base
  belongs_to :league
  
  has_many :odd_spreads, :dependent => :destroy
  has_many :odd_money_lines, :dependent => :destroy
  has_many :odd_total_points, :dependent => :destroy
  
  validates :league_id, presence: true
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :home_number, presence: true
  validates :away_number, presence: true
  
  def self.all_filters
    {
      home_team: 'ILIKE', 
      away_team: 'ILIKE',
      league_id: '=',
      active: '='
    } 
  end    
end