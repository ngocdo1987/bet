class Post < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  
  def self.all_filters
    {
      name: 'ILIKE', 
      description: 'ILIKE',
      content: 'ILIKE'
    }
  end
  
end