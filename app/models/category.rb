class Category < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
   
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :title, presence: true, length: { maximum: 20 } 
    
    scope :order_categories, -> {order(:name)}
    
end
