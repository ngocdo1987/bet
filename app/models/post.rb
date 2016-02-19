class Post < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  mount_uploader :image, PostImageUploader
  validate :image_size
  
  def self.all_filters
    {
      name: 'ILIKE', 
      description: 'ILIKE',
      content: 'ILIKE'
    }
  end
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")        
      end
    end
  
end