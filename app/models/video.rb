class Video < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 10 }
    validates :url, presence: true, length: { minimum: 10 }
    
    def self.all_filters
        {
            name: 'LIKE'
        }
    end
end