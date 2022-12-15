class IngredientsController < ApplicationController
  ## ------这个不要用！！！！------ ##
  # @@apiKey = "7f274a56343748968771ed0642f79c6c"
  ## ------下面的都可以用------ ##
  # @@apiKey = "2e644af47d964b57a970710eec23c5bb"
  # @@apiKey = "06c5643caf1b4d4fb78fa436b127b236"
  # @@apiKey = "2f0cb560447f48f6a6c3d12efee50385"
  # @@apiKey = "fa6f5860fc5c4706bac0c44362038232"
  # @@apiKey = "c2c323be3715495098a70f097b74144d"
  @@apiKey = "5b3ec929ab684d1cb2b060f5b7eb2245"
  #@@apiKey = "0578306e10a44e4bae97ee439fefc5ae"
  #@@apiKey = "23ad34506bd74105828e41a179fda832"


  def show
    id = params[:id] # retrieve movie ID from URI route
    @ingredient = Ingredient.find(id) # look up ingredient by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @ingredients = Ingredient.all
  end

  def create
    cparams = ingredient_params
    if cparams['item'].empty?
      flash[:notice] = "Error - please input a valid name"
      render :new
    elsif cparams['quantity'].to_i <=0
      flash[:notice] = "Error - please input a valid quantity"
      render :new
    else
      cparams['item'] = cparams['item'].titleize
      if !Ingredient.find_by_item(cparams['item']).nil?
        @ingredient = Ingredient.find_by_item(cparams['item'])
        begin 
          @ingredient.update_attributes!(cparams)
          flash[:notice] = "#{@ingredient.item} was successfully updated."
          redirect_to ingredients_path
        rescue
          flash[:notice] = "Error - please input a valid name and quantity"
          render :new
        end
      else
        @ingredient = Ingredient.new(cparams)
        begin 
          @ingredient.save
          flash[:notice] = "#{@ingredient.item} was successfully created."
          redirect_to ingredients_path
        rescue
          flash[:notice] = "Error - please input a valid name and quantity"
          render :new
        end
      end
    end
  end


  def edit
    @ingredient = Ingredient.find params[:id]
    api_info = HTTParty.get("https://api.spoonacular.com/food/ingredients/search?query="+@ingredient.item.downcase, {query: {apiKey: @@apiKey}}).parsed_response
    if !api_info["results"].nil? && !api_info["results"].empty?
      api_id = api_info["results"][0]["id"] 
      nutrient_info = HTTParty.get("https://api.spoonacular.com/food/ingredients/"+api_id.to_s+"/information?amount="+@ingredient.quantity.to_s, {query: {apiKey: @@apiKey}}).parsed_response
      @nutrients = nutrient_info["nutrition"]["nutrients"]
    else
      @nutrients = ""
    end   
  end

  def update
    @ingredient = Ingredient.find params[:id]
    @ingredient.update_attributes!(ingredient_params)
    flash[:notice] = "#{@ingredient.item} was successfully updated."
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    item = @ingredient.item
    @ingredient.destroy
    flash[:notice] = "Ingredient '#{item}' deleted."
    redirect_to ingredients_path
  end

  # private
  # # Making "internal" methods private is not required, but is a common practice.
  # # This helps make clear which methods respond to requests, and which ones do not.
  def ingredient_params
      params.require(:ingredient).permit(:item, :quantity, :quantity_date)
      # params.require(:ingredient).permit(:item, :quantity, :quantity_date)
  end
end
