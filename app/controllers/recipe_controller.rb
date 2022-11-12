require "json"
require "base64"


class RecipeController < ApplicationController
  ##这个不要用！！！！##
  #@@apiKey = "7f274a56343748968771ed0642f79c6c"
  ##下面的都可以用##
  # @@apiKey = "2e644af47d964b57a970710eec23c5bb"
  # @@apiKey = "06c5643caf1b4d4fb78fa436b127b236"
  # @@apiKey = "2f0cb560447f48f6a6c3d12efee50385"
  @@apiKey = "fa6f5860fc5c4706bac0c44362038232"
  # @@apiKey = "c2c323be3715495098a70f097b74144d"
  # @@apiKey = "5b3ec929ab684d1cb2b060f5b7eb2245“
  # @@apiKey = "0578306e10a44e4bae97ee439fefc5ae“
  @@tags = [:cuisine, :intolerances, :diet, :type]


  def show
    # puts "show"
    # puts params

    #@obj = load_recipe(params[:title])
    objs = get_recipes
    targets = objs.select do |item|
      item['title'] == params[:title]
    end

    @obj = objs[0]
  end

  @@ss = []
  @@ingredient_list = []

  def index
    @recipes =[]
    @filters = {}
    @@tags.each do | item |
      # puts item
      @filters[item] = 'Any'
    end
    # puts @filters
    @recipes = get_recipes.sort_by { |el| -el[5] }
    # puts @recipes
  end

  def recipe_params
    params.require(:recipe)
  end

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
  def score(recipe)
    final_score = 0
  
    final_score += (@@ss & @@ingredient_list).size * 0.5

    if not params["recipe"]["cuisine"] == "Any"  and not recipe["cuisine"]==nil
      if recipe["cuisines"].include?(params["recipe"]["cuisine"])
        final_score += 1
      else
        final_score -= 1
      end
    end

    if not params["recipe"]["diet"] == "Any" and not recipe["diet"]==nil
      if recipe["diets"].include?(params["recipe"]["diets"])
        final_score += 1
      else
        final_score -= 1
      end
    end
    
    if not params["recipe"]["intolerances"] == "None" and not recipe["intolerances"]==nil
      if recipe["intolerances"].include?(params["recipe"]["intolerances"])
        final_score += 1
      else
        final_score -= 1
      end
    end
      
    if not params["recipe"]["occasion"] == "Any" and not recipe["occasion"]==nil
      if recipe["occasions"].include?(params["recipe"]["occasion"])
        final_score += 1
      else
        final_score -= 1
      end
    end

    if not params["recipe"]["time"] == "Any" and not recipe["time"]==nil
      if recipe["readyInMinutes"] <= params["recipe"]["time"].split()[1].to_i()
        final_score += 1
      else
        final_score -= 1
      end
    end

    return final_score

  end


  def call_service(items)
    ss = items.map do |item|
      item.item.downcase
    end
    @@ss = ss.clone
    
    if not params.keys().include?("recipe")
      params["recipe"]={"cuisine"=>"Any", "diet"=>"Any", "intolerances"=>"None", "occasion"=>"Any", "time"=>"Any"}
    end

    key = ss.join(',')
    num = 5
    site = "https://api.spoonacular.com/recipes/findByIngredients"

    query_param = {ingredients: key, number: num, apiKey: @@apiKey}
    #condition_param = params[:condition]
    #if condition_param
    #  @@tags.each do | item |
    #    v = condition_param[item]
    #    if v && v != 'Any'
    #      puts v
    #      @filters[item] = v
    #      query_param[item] = v
    #    end
    #  end
    #end

    # puts query_param

    objs = HTTParty.get(site, {query: query_param, header: {'Content-Type' => 'application/json'}}).parsed_response
    # puts objs

    recipe_list = []
    # more info about objs
    objs.each do |obj|
      info = HTTParty.get("https://api.spoonacular.com/recipes/"+obj['id'].to_s+"/information", {query: {apiKey: @@apiKey}}) 
      exts = info["extendedIngredients"]
      exts.each do |ext|
        @@ingredient_list.append(ext["name"])
      end
      recipe_list.append([info["title"], info["cuisines"], info["diets"], info["occasions"], info["readyInMinutes"], score(info)])
    end
    return recipe_list
  end


  def get_recipes
    items = Ingredient.where("quantity > 0")
    return call_service(items)

  end


  # def ingredient_params
  #   params.require(@recipes).permit(:title, :cuisines, :diets,:occasions,:readyInMinutes)
  # end
end
