class Nutrition < ActiveRecord::Base
  belongs_to :recipe
  
  validates :recipe_id, presence: true
  validates :nutrition_name, presence: true
end