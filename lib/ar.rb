module Ar
    def self.search(model, all_params)
        conditions = []
            
        model.all_filters.each_pair do |k, v|
            filter_var = all_params[k].blank? ? '' : all_params[k]
            if v == 'LIKE'
                secure_var = model.sanitize("%#{filter_var}%")   
            else
                secure_var = model.sanitize("#{filter_var}")
            end
                
            conditions.push("#{k} #{v} #{secure_var}") if filter_var != ''
        end
            
        conditions = conditions.join(" AND ")
            
        model.where(conditions)::paginate(page: all_params[:page], per_page: 10)   
    end       
end