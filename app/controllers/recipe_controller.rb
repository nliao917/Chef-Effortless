class RecipeController < ApplicationController
  @@apiKey = "7f274a56343748968771ed0642f79c6c"

  def index
    @recipes =[]
    #if Ingredient.find_quantity('Tomato') >0 and Ingredient.find_quantity('Egg') >0
    #  @recipes.push("Scambled Egg")
    #end
    #if Ingredient.find_quantity('Beef') >0 and  Ingredient.find_quantity('Potato') >0
    #  @recipes.push("Beef over Potato")
    #end

    objs = get_recipes
    objs.each do |obj|
      @recipes.push(obj['title'])
    end
    
  end

  def recipe_params
    params.require(:recipe)
  end

  def call_service(items)
    ss = items.map do |item|
      item.item
    end

    key = ss.join(',')
    num = 5
    site = "https://api.spoonacular.com/recipes/findByIngredients"
    objs = HTTParty.get(site, {query: {ingredients: key, number: num, apiKey: @@apiKey}, header: {'Content-Type' => 'application/json'}}).parsed_response

    return objs 

  end


  def get_recipes
    items = Ingredient.where("quantity > 0")
    return call_service(items)

  end
end
