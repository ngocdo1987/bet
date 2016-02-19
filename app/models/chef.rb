class Chef < ActiveRecord::Base
  has_many :recipes
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validate :image_size
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
  validates :email, presence: true, length: { maximum: 105 }, 
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
                                      
  mount_uploader :image, ChefImageUploader                                    
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h   
  after_update :crop_image
                                      
  def self.all_filters
    {
      chefname: 'ILIKE', 
      email: 'ILIKE', 
      position: 'ILIKE',
      description: 'ILIKE',
      home: '='
    }
  end 
  
  def crop_image
    image.recreate_versions! if crop_x.present?
    
  end
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")        
      end
    end
end