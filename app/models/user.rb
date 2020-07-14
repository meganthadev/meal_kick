class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many  :recipe_comments, through: :comments, source: :recipe 
    has_secure_password
    validates :username, presence: true, length: { in: 3..20 }
    validates :email, uniqueness: true
    validates :email, presence: true 
    
    
    


end
