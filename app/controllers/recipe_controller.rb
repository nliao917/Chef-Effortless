require "json"
require "base64"

class RecipeController < ApplicationController
  ## ------这个不要用！！！！------ ##
  # @@apiKey = "7f274a56343748968771ed0642f79c6c"
  ## ------下面的都可以用------ ##
  # @@apiKey = "2e644af47d964b57a970710eec23c5bb"
  # @@apiKey = "06c5643caf1b4d4fb78fa436b127b236"
  # @@apiKey = "2f0cb560447f48f6a6c3d12efee50385"
  # @@apiKey = "fa6f5860fc5c4706bac0c44362038232"
  # @@apiKey = "c2c323be3715495098a70f097b74144d"
  # @@apiKey = "5b3ec929ab684d1cb2b060f5b7eb2245"
  # @@apiKey = "0578306e10a44e4bae97ee439fefc5ae"

  @@apiKey = "23ad34506bd74105828e41a179fda832"

  @@tags = [:cuisine, :intolerances, :diet, :type]
  @@ss = []
  @@api_list = []
  def get_steps_info(id)
    info = HTTParty.get("https://api.spoonacular.com/recipes/"+id.to_s+"/analyzedInstructions", {query: {apiKey: @@apiKey}}).parsed_response
    return info
  end

  def get_recipe_info(id, includeNutrition)
    info = HTTParty.get("https://api.spoonacular.com/recipes/"+id.to_s+"/information", {query: {includeNutrition: includeNutrition, apiKey: @@apiKey}}).parsed_response
    return info
  end

  def detail_impl(params)
    @obj = get_recipe_info(params['id'], true)
    #puts "--------------------------"
    #puts @obj
    return @obj
  end


  def detail
    @obj = get_recipe_info(params['id'], true)
    #puts "--------------------------"
    #puts @obj
  end

  def show
    @obj = get_recipe_info(params['id'], false)
    @step = get_steps_info(params['id'])
  end

  def show_impl(params)
    @obj = get_recipe_info(params['id'], false)
    @step = get_steps_info(params['id'])
    return @obj, @step
  end


  def index
    #get_recipes[1]
    @recipes = get_recipes[1].sort_by { |el| -el[5] }
    return @receipes
  end

  # def recipe_params
  #   params.require(:recipe)
  # end

  #def load_recipe(title) 
  #  obj = nil
  #  File.open(title, 'r') do | f |
  #    content = f.read
  #    obj = JSON.parse(content)
  #  end

  #  return obj
  #end

  #def save_recipes(objs)
  #  objs.each do | obj |
  #    save_recipe(obj)
  #  end
  #end

  #def save_recipe(obj) 
  #  title = obj['title']
  #  #title = Base64.encode64(title)
  #  content = obj.to_json
  #  File.open(title, 'w') do | f |
  #    f.write(content)
  #  end
  #end

  def max_count(conds)
    count = 0
    conds.each do |k, v| 
      if v != 'Any' and v != 'None'
        count = count + 1
      end
    end
    count
  end



  def score(recipe, params)
    final_score = 0
    count = 0
  
    final_score += (@@ss & @@api_list).size * 0.2

    if not params["recipe"]["cuisine"] == "Any" and not recipe["cuisines"]==nil
      if recipe["cuisines"].include?(params["recipe"]["cuisine"])
        final_score += 1
        count += 1
      else
        final_score -= 1
      end
    end

    if not params["recipe"]["diet"] == "Any" and not recipe["diets"]==nil
      if recipe["diets"].include?(params["recipe"]["diet"])
        final_score += 1
        count += 1
      else
        final_score -= 1
      end
    end
      
    if not params["recipe"]["occasion"] == "Any" and not recipe["occasions"]==nil
      if recipe["occasions"].include?(params["recipe"]["occasion"])
        final_score += 1
        count += 1
      else
        final_score -= 1
      end
    end

    return final_score, count

  end


  def get_recipes
    items = get_ingredients

    @@ss = items.map do |item|
      item.item.downcase
    end
    
    if not params.keys().include?("recipe")
      params["recipe"]={"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}
    end

    key = @@ss.join(',')
    num = 5
    site = "https://api.spoonacular.com/recipes/findByIngredients"
    query_param = {ingredients: key, number: num, apiKey: @@apiKey, ignorePantry: true}

    # puts query_param
    objs = HTTParty.get(site, {query: query_param, header: {'Content-Type' => 'application/json'}}).parsed_response

    @@api_list = []
    recipe_list = []
    obj_target_count = max_count(params['recipe'])

    objs.each do |obj|
      info = get_recipe_info(obj['id'], false)
      exts = info["extendedIngredients"]
      obj_score, obj_count = score(info, params)

      exts.each do |ext|
        @@api_list.append(ext["name"])
      end

      recipe_list.append([info["title"], info["cuisines"], info["diets"], info["occasions"], info["readyInMinutes"], obj_score, info['id']])

    end

    return @@api_list, recipe_list
  end

  def get_ingredients
    return Ingredient.where("quantity > 0")
  end

end
