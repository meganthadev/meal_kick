class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy 
  has_many :users, through: :comments

  delegate :name, to: :category
  
  validates :title, presence: true, length: { in: 3..30 }
  validates :description, presence: true, length: { in: 15..100 }
  validates :instructions, presence: true, length: { maximum: 750 }
  scope :alpha, -> { order(:title) }
  
  accepts_nested_attributes_for :users

  def category_attributes(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end 




end
