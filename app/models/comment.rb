class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    
    validates :content, presence: true, length: { maximum: 200 } 
    default_scope { order(created_at: :desc)}

    validates :recipe, uniqueness: {scope: :user_id, message: "may only have one comment per user"}
    
    
end
