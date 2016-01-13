class Base < ActiveRecord::Base
    def self.search(all_filters, all_params)
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