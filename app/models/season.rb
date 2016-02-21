class Season < ActiveRecord::Base
  has_many :assign_teams, :dependent => :destroy
  has_many :leagues, :through => :assign_teams
  has_many :teams, :through => :assign_teams
  
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :slug, presence: true, length: { minimum: 5 }, uniqueness: true
  
  def self.all_filters
    {
      name: 'ILIKE', 
      slug: 'ILIKE'
    }
  end
  
end