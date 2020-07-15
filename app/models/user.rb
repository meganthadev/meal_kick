class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many :recipe_comments, through: :comments, source: :recipe 
    has_many :categories, through: :recipes
    
    has_secure_password
    
    validates :username, presence: true, length: { in: 3..18 }
    validates :email, presence: true 
    validates :email, uniqueness: true
   


end
