class Tag < ActiveRecord::Base
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, length: { minimum: 3 }
  
  def self.all_filters
    {
      name: 'ILIKE'
    }
  end
end