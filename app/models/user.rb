class User < ActiveRecord::Base
    has_many :bet_spreads
    has_many :bet_money_lines
    has_many :bet_total_points
    
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :username, presence: true
    validates :password, presence: true
    validates :email, presence: true, length: { maximum: 105 }, 
                                        uniqueness: { case_sensitive: false },
                                        format: { with: VALID_EMAIL_REGEX }
end