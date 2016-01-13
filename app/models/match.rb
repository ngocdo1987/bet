class Match < ActiveRecord::Base
    belongs_to :league
    has_many :odd_spreads
    has_many :odd_money_lines
    has_many :odd_total_points
    
    validates :league_id, presence: true
    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :home_number, presence: true
    validates :away_number, presence: true
    
    def self.search(all_params)
        all_filters = {
            'home_team' => 'LIKE', 
            'away_team' => 'LIKE',
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