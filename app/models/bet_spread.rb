class BetSpread < ActiveRecord::Base
  belongs_to :user
  belongs_to :match    
  belongs_to :odd_spread
  
  validates :user_id, presence: true
  validates :match_id, presence: true
    
end