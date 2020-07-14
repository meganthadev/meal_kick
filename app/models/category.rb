class Category < ApplicationRecord
    has_many :recipes
    validates :title, presence: true, length: { maximum: 20 } 
    default_scope { order(created_at: :desc)}
end
