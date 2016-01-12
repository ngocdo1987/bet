class Video < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 10 }
    validates :url, presence: true, length: { minimum: 10 }
end