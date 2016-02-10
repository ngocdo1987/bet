class League < ActiveRecord::Base
  has_many :matches
  validates :league_name, presence: true, length: { minimum: 3 }
  validates :league_type, presence: true, length: { minimum: 5 }
  mount_uploader :league_image, LeagueImageUploader
  validate :league_image_size
  
  def self.all_filters
    {
      league_name: 'ILIKE', 
      league_type: '=',
      active: '='
    }
  end
  
  private
    def league_image_size
      if league_image.size > 5.megabytes
        errors.add(:league_image, "should be less than 5MB")        
      end
    end
end