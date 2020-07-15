class Category < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
    validates :title, presence: true, length: { maximum: 20 } 
    default_scope { order(created_at: :desc)}
end
