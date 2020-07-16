class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many :recipe_comments, through: :comments, source: :recipe 
    has_many :categories, through: :recipes
    
    has_secure_password #(authenticate, validate password, password confirmation)
    
    validates :username, presence: true, length: { in: 3..18 }
    validates :email, presence: true 
    validates :email, uniqueness: true
   
    def self.most_recipes
        joins(:recipes).group(:user_id).order("count(user_id) DESC").limit(3)
        # combine with recipes  - JOIN
        # count no. of posts
        # sort desc  - ORDER
    end

    

end
