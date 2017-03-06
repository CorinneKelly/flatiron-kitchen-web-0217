require 'pry'
class RecipesController < ApplicationController
	before_action :set_recipe, only: [:show, :edit, :update]
	before_action :set_ingredients

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(name: recipe_params[:name])
		@recipe.ingredients = Ingredient.where(id: recipe_params[:ingredient_id])
		redirect_to recipe_path(@recipe)
	end

	def show
	end

	def edit
		@extra_ingredients = @recipe.non_recipe_ingredients
	end

	def update
		@recipe.update(name: recipe_params[:name])
		@recipe.ingredients = Ingredient.where(id: recipe_params[:ingredient_id])
		redirect_to recipe_path(@recipe)
	end

	private
	def recipe_params
		params.require(:recipe).permit(:name, ingredient_id: [])
	end

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def set_ingredients
		@ingredients = Ingredient.all
	end

end
