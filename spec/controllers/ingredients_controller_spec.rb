require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "Post #create" do
    it "redirect to index page" do
      post :create, {ingredient: {item: 'test', quantity: 2, expiration__date: '2023-05-25'}}
      expect(response).to redirect_to(ingredients_path)
    end
  end

end
