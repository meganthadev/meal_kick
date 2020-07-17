class AddIndexToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_index :recipes, :title
  end
end
