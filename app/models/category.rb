class Category < ApplicationRecord
    has_many :recipes
   
    validates :name, presence: true, length: { maximum: 20 }
    validates :name, uniqueness: true, on: :create
   
    default_scope { order(name: :desc)}

    
end
