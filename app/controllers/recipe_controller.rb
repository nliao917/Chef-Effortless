class RecipeController < ApplicationController
  def index
    @recipes =[]
    if Ingredient.find_quantity('Tomato') >0 and Ingredient.find_quantity('Egg') >0
      @recipes.push("Scambled Egg")
    end
    if Ingredient.find_quantity('Beef') >0 and  Ingredient.find_quantity('Potato') >0
      @recipes.push("Beef over Potato")
    end
    
  end

  def recipe_params
    params.require(:recipe)
  end

end
