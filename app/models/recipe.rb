class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 5, maximum: 200 }
  validates :description, presence: true, length: { minimum: 5, maximum: 5000 }
  
  def self.all_filters
    {
      chef_id: '=',
      name: 'ILIKE',
      summary: 'ILIKE',
      description: 'ILIKE'
    }
  end
end