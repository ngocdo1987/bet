class Chef < ActiveRecord::Base
  has_many :recipes
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  mount_uploader :image, ChefImageUploader
  validate :image_size
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  validates :email, presence: true, length: { maximum: 105 }, 
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
                                      
  def self.all_filters
    {
      chefname: 'ILIKE', 
      email: 'ILIKE', 
      position: 'ILIKE',
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