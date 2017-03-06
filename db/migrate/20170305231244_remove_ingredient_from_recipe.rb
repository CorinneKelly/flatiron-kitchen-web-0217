class RemoveIngredientFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient, :string
  end
end
