class Location < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  validates :address, presence: true, length: { minimum: 3, maximum: 200 }
  validates :phone, presence: true, length: { minimum: 3, maximum: 200 }
  validates :email, presence: true, length: { maximum: 105 }, 
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
                                      
                               
  def self.all_filters
    {
      name: 'ILIKE', 
      address: 'ILIKE', 
      phone: 'ILIKE',
      fax: 'ILIKE',
      email: 'ILIKE'
    }
  end 
  
end