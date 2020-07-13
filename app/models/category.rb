class Category < ApplicationRecord
    has_many :recipes
    validates :title, presence: true, length: { maximum: 20 } 
end
