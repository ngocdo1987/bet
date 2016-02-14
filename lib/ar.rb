module Ar
  def self.search(model, all_params)
    conditions = []
        
    model.all_filters.each_pair do |k, v|
      filter_var = all_params[k].blank? ? '' : all_params[k]
      # ILIKE for PostgreSQL
      if v == 'LIKE' || v == 'ILIKE'
        secure_var = model.sanitize("%#{filter_var}%")   
      else
        secure_var = model.sanitize("#{filter_var}")
      end
          
      conditions.push("#{k} #{v} #{secure_var}") if filter_var != ''
    end
        
    conditions = conditions.join(" AND ")
        
    model.where(conditions).paginate(page: all_params[:page], per_page: 10)   
  end
    
  def self.ancestry(model)
    model.all.each { 
        |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s 
    }.sort {|x,y| x.ancestry <=> y.ancestry 
    }.map{ |c| ["---" * (c.depth - 1) + c.name, c.id] 
    }  
  end
    
  def self.ancestry_ar(model, all_params)
    if all_params[:name].blank? == true
      model.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s 
          }.sort {|x,y| x.ancestry <=> y.ancestry 
          }.map{ |c| { id: c.id, name: "---" * (c.depth - 1) + c.name, slug: c.slug } 
          }     
    else
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
          
      model.where(conditions).paginate(page: all_params[:page], per_page: 10).map{ |c| { 
          id: c.id, 
          name: c.name, 
          slug: c.slug 
        } 
      }
    end
  end
end