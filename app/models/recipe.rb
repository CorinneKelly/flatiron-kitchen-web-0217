class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true

	def non_recipe_ingredients
		non_recipe_ingredient_array = []
		Ingredient.all.each do |ingredient|
			unless self.ingredients.include?(ingredient)
				non_recipe_ingredient_array << ingredient
			end	
		non_recipe_ingredient_array
		end
		
	end
end
