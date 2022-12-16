require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  before do 
    @user = User.find_by(email: 'test@test.com')
    if @user == nil 
      @user = User.create!({email: 'test@test.com', password: 'password', password_confirmation: 'password'})
    end
    sign_in @user
    
  end

  describe "CRUD of the website" do

    describe "Post #create" do
      it "redirect to index page" do
        post :create, {ingredient: {item: 'test', quantity: 2, expiration__date: '2023-05-25', user_id: '1'}}
        expect(response).to redirect_to(ingredients_path)
      end
    end

    describe "index page" do
      it "correctly lands on the index page" do
        get :index
        expect(response).to render_template('index')
      end
    end

    context "Showing a Ingredient" do
      before :each do
        Ingredient.create(item: 'test', quantity: '3', expiration_date: Date.new(1977,5,25))
        @ingredients = Ingredient.all
      end

      it "Should be show an ingredient" do
        get :show, id: @ingredients.take.id
        expect(assigns(:ingredient)).to eq(@ingredients.take)
      end

    end

    context "Editing an Ingredient" do
      before :each do
        Ingredient.create(item: 'test', quantity: '3', expiration_date: Date.new(1977,5,25))
        @ingredients = Ingredient.all
      end

      it "Should be edit an Ingredient" do
        get :edit, id: @ingredients.take.id
        expect(assigns(:ingredient)).to eq(@ingredients.take)
      end
    end

    context "Updating Ingredients" do
      before :each do
        Ingredient.create(item: 'test', quantity: '3', expiration_date: Date.new(1977,5,25))
        @ingredients = Ingredient.all
      end

      it "Should be updating an ingredient" do
        ingredient = @ingredients.take
        ingredient_param = {quantity: '4'}
        put :update, id: ingredient.id, ingredient: ingredient_param
      
        expect(response).to redirect_to(ingredient_path(ingredient.id ))
        expect(Ingredient.find(ingredient.id).quantity).to eq(4)
      end

    end

    context "Deleting Ingredients" do
      let!(:ingredient1) {Ingredient.create(item: 'test', quantity: '3', expiration_date: Date.new(1977,5,25))}

      it "Should be deleting an ingredient" do
        expect { delete :destroy, id: ingredient1.id}.to change(Ingredient, :count).by(-1)
      end

      it "redirects to index page after deletion" do
        delete :destroy, id: ingredient1.id
        expect(response).to redirect_to(ingredients_path)
      end
    end
  end
end