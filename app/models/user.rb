class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many  :recipe_comments, through: :comments, source: :recipe 
    has_secure_password
    
    


end
