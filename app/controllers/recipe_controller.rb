class RecipeController < ApplicationController
  # @@apiKey = "7f274a56343748968771ed0642f79c6c"
  @@apiKey = "2e644af47d964b57a970710eec23c5bb"

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
      # @recipes.push(obj['title'])
      @recipes.push(obj)
    end
    
  end

  def recipe_params
    params.require(:recipe)
  end

  def score(recipe)
    # 80% ingredients
    # occassion, diets, cuisines, readyTime
    # default score, 
    # 
    cuisine = recipe["cuisines"]
    diet = recipe["diets"]
    # intolerance = recipe
    occasions = recipe["occasions"]
    readyTime = recipe["readyInMinutes"]
    
    final_score = 0
    if not params["recipe"]["cuisine"] == "Any"
      if recipe["cuisines"].include?(params["recipe"]["cuisine"])
        final_score += 1
      else
        final_score -= 1
      end
    end

    if not params["recipe"]["diet"] == "Any"
      if recipe["diets"].include?(params["recipe"]["diets"])
        final_score += 1
      else
        final_score -= 1
      end
    end
      
    # if not params["recipe"]["intolerances"] == "None"
    #   if recipe["intolerances"].include?(params["recipe"]["intolerances"])
    #     final_score += 1
    #   else
    #     final_score -= 1
    #   end
    # end
      
    if not params["recipe"]["occasion"] == "Any"
      if recipe["occasions"].include?(params["recipe"]["occasion"])
        final_score += 1
      else
        final_score -= 1
      end
    end

    if not params["recipe"]["time"] == "Any"
      if recipe["readyInMinutes"]<=params["recipe"]["time"].split()[1].to_i()
        final_score += 1
      else
        final_score -= 1
      end
    end
    return final_score

  end


  def call_service(items)
    ss = items.map do |item|
      item.item
    end

    # print(params['recipe'])
    if not params.keys().include?("recipe")
      params["recipe"]={"cuisine"=>"Any", "diet"=>"Any", "intolerances"=>"None", "occasion"=>"Any", "time"=>"Any"}
    end

    key = ss.join(',')
    num = 5
    site = "https://api.spoonacular.com/recipes/findByIngredients"
    objs = HTTParty.get(site, {query: {ingredients: key, number: num, apiKey: @@apiKey}, header: {'Content-Type' => 'application/json'}}).parsed_response

    recipe_list = []


    # more info about objs
    objs.each do |obj|
      info = HTTParty.get("https://api.spoonacular.com/recipes/"+obj['id'].to_s+"/information", {query: {apiKey: @@apiKey}}) 
    #   # score ranking list display
    #   # ready_time = info["readyInMinutes"]
      recipe_list.append([info["title"], info["cuisines"], info["diets"], info["occasions"], info["readyInMinutes"], score(info)])
    #   # puts(info.keys().include?("score"))
    #   # obj["score"] = score(info)
    #   # add score as key
    #   obj["score"] = score(info)
    end


    return recipe_list
  end


  def get_recipes
    items = Ingredient.where("quantity > 0")
    return call_service(items)

  end
end