class Cuisine < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :slug, presence: true, length: { minimum: 3 }, uniqueness: true
  
  def self.all_filters
    {
      name: 'ILIKE',
      description: 'ILIKE'
    }
  end
end