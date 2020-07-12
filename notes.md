Meal Planning App (MealKick)

Recipes
-title :string
-descrip. :text
-instructions :text
-belongs_to :category
-belongs_to :user
-has_many :comments

+-


Categories
-Name :string
-has_many :recipes


Users
-Username :string
-Email (unique) :string
-password_digest :string
-has_many :recipes
-has_many :comments
-has_many :comment_recipes, through :comments


Comments (Join table, users & recipes)
-belongs_to :user
-belongs_to :recipe
-content :text
- user_id :integer
- recipe_id :integer





