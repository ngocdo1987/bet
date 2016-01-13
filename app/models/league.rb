class League < ActiveRecord::Base
    has_many :matches
    validates :league_name, presence: true, length: { minimum: 3 }
    validates :league_type, presence: true, length: { minimum: 5 }
    mount_uploader :league_image, LeagueImageUploader
    validate :league_image_size
    
    private
        def league_image_size
            if league_image.size > 5.megabytes
                errors.add(:league_image, "should be less than 5MB")        
            end
        end
        
    def self.search(all_params)
        all_filters = {
            'league_name' => 'LIKE', 
            'league_type' => '=',
            'active' => '='
        }
        conditions = []
        
        all_filters.each_pair do |k, v|
            filter_var = all_params[k].blank? ? '' : all_params[k]
            if v == 'LIKE'
                secure_var = self.sanitize("%#{filter_var}%")   
            else
                secure_var = self.sanitize("#{filter_var}")         
            end
            
            conditions.push("#{k} #{v} " + secure_var) if filter_var != ''
        end
        
        conditions = conditions.join(" AND ")
        
        return self.where(conditions).paginate(page: all_params[:page], per_page: 10) 
    end
end