class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def self.all_filters
    {
      username: 'ILIKE', 
      email: 'ILIKE',
      first_name: 'ILIKE',
      last_name: 'ILIKE',
      role: '='
    }
  end        
end
