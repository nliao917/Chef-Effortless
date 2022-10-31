class RecipeController < ApplicationController

  def index
    if Ingredient.find_by_item('Tomato').quantity>0 and Ingredient.find_by_item('Egg').quantity>0
      @recipes = "Tomato Egg"
    end
  end

  def recipe_params
    params.require(:recipes)
  end
end
