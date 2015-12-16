class League < ActiveRecord::Base
    has_many :matches
    validates :league_name, presence: true, length: { minimum: 5 }
    validates :league_type, presence: true, length: { minimum: 5 }
    
end