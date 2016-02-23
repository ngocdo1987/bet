class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  
  validates :recipe_id, presence: true
  validates :ingredient_name, presence: true
end