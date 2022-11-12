require "json"
require "base64"


class RecipeController < ApplicationController
  @@apiKey = "7f274a56343748968771ed0642f79c6c"
  @@tags = [:cuisine, :intolerances, :diet, :type]


  def show
    puts "show"
    puts params

    #@obj = load_recipe(params[:title])
    objs = get_recipes
    targets = objs.select do |item|
      item['title'] == params[:title]
    end

    @obj = objs[0]
  end

  def index
    @recipes =[]
    #if Ingredient.find_quantity('Tomato') >0 and Ingredient.find_quantity('Egg') >0
    #  @recipes.push("Scambled Egg")
    #end
    #if Ingredient.find_quantity('Beef') >0 and  Ingredient.find_quantity('Potato') >0
    #  @recipes.push("Beef over Potato")
    #end
    @filters = {}
    @@tags.each do | item |
      puts item
      @filters[item] = 'Any'
    end

    puts @filters


    objs = get_recipes
    objs.each do |obj|
      #puts obj

      #save_recipe(obj)
      #puts obj

      @recipes.push(obj)
    end
    
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

  def call_service(items)
    ss = items.map do |item|
      item.item
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

    puts query_param



    objs = HTTParty.get(site, {query: query_param, header: {'Content-Type' => 'application/json'}}).parsed_response
    puts objs

    return objs 

  end


  def get_recipes
    items = Ingredient.where("quantity > 0")
    return call_service(items)

  end
end
