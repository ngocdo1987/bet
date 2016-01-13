class Video < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 10 }
    validates :url, presence: true, length: { minimum: 10 }
    
    def self.search(all_params)
        all_filters = {
            'name' => 'LIKE'
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