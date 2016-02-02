class OddMoneyLine < ActiveRecord::Base
  belongs_to :match
  validates :match_id, presence: true
  validates :home_odd, presence: true
  validates :away_odd, presence: true
end