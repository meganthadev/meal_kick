class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many :recipe_comments, through: :comments, source: :recipe 
    has_many :categories, through: :recipes
    has_secure_password
    validates :username, presence: true, length: { in: 3..18 }
    validates :email, presence: true 
    validates :email, uniqueness: true
   
    
    
    def authored_this(com)
        if com.class == Recipe && com.user_id == self.id 
          true
        elsif com.class == Comment && com.user_id == self.id 
          true
        else
          false
        end
      end


end
