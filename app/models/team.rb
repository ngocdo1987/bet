class Team < ActiveRecord::Base
    belongs_to :league
    
    validates :name, presence: true, length: { minimum: 3 }
    validates :total_matches, numericality: true
    validates :total_points, numericality: true
    validates :league_id, presence: true
    mount_uploader :image, TeamImageUploader
    validate :image_size
    
    private
        def image_size
            if image.size > 5.megabytes
                errors.add(:image, "should be less than 5MB")        
            end
        end
    
    def self.search(all_params)
        all_filters = {
            'name' => 'LIKE', 
            'description' => 'LIKE',
            'league_id' => '=',
            'active' => '='
        }
        conditions = []
        
        all_filters.each_pair do |k, v|
            filter_var = all_params[k].blank? ? '' : all_params[k]
            if v == 'LIKE'
                secure_var = self.sanitize("%#{filter_var}%")   
            else
                secure_var = self.sanitize("#{filter_var}")  
                #secure_var = filter_var
            end
            
            conditions.push("#{k} #{v} " + secure_var) if filter_var != ''
        end
        
        conditions = conditions.join(" AND ")
        
        return self.where(conditions).paginate(page: all_params[:page], per_page: 10)            
    end
end