class ContactForm
  include ActiveModel::Model
  
  attr_accessor :name, :email, :phone, :message
  
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true
  validates :message, presence: true
  
end