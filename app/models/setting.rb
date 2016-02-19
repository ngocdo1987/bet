class Setting < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :value, presence: true, length: { minimum: 3 }
  
  def self.all_filters
    {
      name: 'ILIKE',
      value: 'ILIKE'
    }
  end  
end