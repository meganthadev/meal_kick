class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy 
  has_many :users, through: :comments

  delegate :name, to: :category
  
  validates :title, presence: true, length: { in: 3..30 }
  validates :category, presence: true
  validates :description, presence: true, length: { in: 15..100 }
  validates :instructions, presence: true, length: { maximum: 750 }
  scope :alpha, -> { order(:title) }
  scope :most_comments, -> {left_joins(:comments).group('recipes.id').order('count(comments.recipe_id) desc')}
  

  def category_attributes(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end 




end
