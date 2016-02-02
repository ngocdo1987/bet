class Category < ActiveRecord::Base
  has_ancestry
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, length: { minimum: 3 }
  
  def self.all_filters
    {
      name: 'LIKE', 
      slug: 'LIKE'
    }
  end
end