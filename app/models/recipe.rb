class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 5, maximum: 200 }
  validates :description, presence: true, length: { minimum: 5, maximum: 5000 }
  mount_uploader :image, RecipeImageUploader
  validate :image_size
  
  def self.all_filters
    {
      chef_id: '=',
      name: 'ILIKE',
      summary: 'ILIKE',
      description: 'ILIKE'
    }
  end
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")        
      end
    end
end