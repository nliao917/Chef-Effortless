class IngredientsController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @ingredient = Ingredient.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @ingredients = Ingredient.all
  end

  # def new
  #   # default: render 'new' template
  # end

  def create
    @ingredient = Ingredient.create!(ingredient_params)
    flash[:notice] = "#{@ingredient.item} was successfully created."
    redirect_to ingredients_path
  end

  def edit
    @ingredient = Ingredient.find params[:id]
  end

  def update
    @ingredient = Ingredient.find params[:id]
    @ingredient.update_attributes!(ingredient_params)
    flash[:notice] = "#{@ingredient.item} was successfully updated."
    redirect_to ingredient_path(@ingredient)
  end

  # def destroy
  #   @ingredient = Ingredient.find(params[:id])
  #   @ingredient.destroy
  #   flash[:notice] = "Ingredient '#{@ingredient.title}' deleted."
  #   redirect_to ingredients_path
  # end

  # private
  # # Making "internal" methods private is not required, but is a common practice.
  # # This helps make clear which methods respond to requests, and which ones do not.
  def ingredient_params
    params.require(:ingredient).permit(:item, :quantity, :quantity_date)
  end
end
