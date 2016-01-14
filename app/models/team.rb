class Team < ActiveRecord::Base
    belongs_to :league
    
    validates :name, presence: true, length: { minimum: 3 }
    validates :total_matches, numericality: true
    validates :total_points, numericality: true
    validates :league_id, presence: true
    mount_uploader :image, TeamImageUploader
    validate :image_size
    
    def self.all_filters
        return {
            name: 'LIKE', 
            description: 'LIKE',
            league_id: '=',
            active: '='
        }    
    end
    
    private
        def image_size
            if image.size > 5.megabytes
                errors.add(:image, "should be less than 5MB")        
            end
        end
end