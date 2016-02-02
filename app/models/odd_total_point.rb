class OddTotalPoint < ActiveRecord::Base
  belongs_to :match
  validates :match_id, presence: true
  validates :over_hdc, presence: true
  validates :under_hdc, presence: true
  validates :over_odd, presence: true
  validates :under_odd, presence: true
end