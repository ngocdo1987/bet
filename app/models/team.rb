class Team < ActiveRecord::Base
  has_many :assign_teams, :dependent => :destroy
  has_many :leagues, :through => :assign_teams
  has_many :seasons, :through => :assign_teams
  
  validates :name, presence: true, length: { minimum: 3 }
  mount_uploader :image, TeamImageUploader
  validate :image_size
  
  def self.all_filters
    {
      name: 'ILIKE', 
      description: 'ILIKE'
      #league_id: '=',
      #active: '='
    }    
  end
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")        
      end
    end
end