
require 'rails_helper'

RSpec.describe RecipeController, type: :controller do
  let(:job) {RecipeController.new} 
    
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #step" do
    it "returns http success" do
      get :show, id: 648345
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #detail" do
    it "returns http success" do
      get :detail, id: 648345
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search" do
    it "returns http success" do
      get :search, id: 648345
      expect(response).to have_http_status(:success)
    end
  end

  describe "get_steps_info" do
    it "should give recipe steps information" do
      id = 653775
      expect(job.get_steps_info(id)).not_to be_nil
    end
  end

  describe "get_recipe_info" do
    it "should give recipe information" do
      id = 653775
      includeNutrition = false
      expect(job.get_recipe_info(id, includeNutrition)).not_to be_nil
    end
  end

  describe "detail" do
    it "should give recipe details" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "intolerances"=>"None", "occasion"=>"Any", "time"=>"Any"}}
      expect(job.detail_impl(params)).not_to be_nil
    end
  end

  describe "show" do
    it "should show recipe info and steps" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "intolerances"=>"None", "occasion"=>"Any", "time"=>"Any"}}
      expect(job.show_impl(params)).not_to be_nil
    end
  end

  # describe "index" do
  #   it "should show sorted recipes" do
  #     params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "intolerances"=>"None", "occasion"=>"Any", "time"=>"Any"}}
  #     input = job.get_recipes[1]
  #     expect(job.get_sorted_recipes(params)).not_to be_nil
  #   end
  # end

  describe "score" do
    it "should pass any" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}}
      recipe = {"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}
      expect(job.score(recipe, params)).to eq([0.0, 0])
    end
  end

  describe "score" do
    it "should pass cuisine" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Mexican", "diet"=>"Any", "occasion"=>"Any"}}
      recipe = {"cuisines"=>"Mexican"}
      expect(job.score(recipe, params)).to eq([1.0, 1])
    end
  end

  describe "score" do
    it "should not pass cuisine" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Mexican", "diet"=>"Any", "occasion"=>"Any"}}
      recipe = {"cuisines"=>"Indian"}
      expect(job.score(recipe, params)).to eq([-1.0, 0])
    end
  end

  describe "score" do
    it "should pass diet" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Vegan", "occasion"=>"Any"}}
      recipe = {"diets"=>"Vegan"}
      expect(job.score(recipe, params)).to eq([1.0, 1])
    end
  end

  describe "score" do
    it "should not pass diet" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Vegan", "occasion"=>"Any"}}
      recipe = {"diets"=>"Paleo"}
      expect(job.score(recipe, params)).to eq([-1.0, 0])
    end
  end

  # describe "score" do
  #   it "should pass Diary intolerances" do
  #     params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}}
  #     recipe = {"intolerances"=>"Diary"}
  #     expect(job.score(recipe, params)).to eq([1.0, 1])
  #   end
  # end

  # describe "score" do
  #   it "should not pass Diary intolerances" do
  #     params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}}
  #     recipe = {"intolerances"=>"Diary"}
  #     expect(job.score(recipe, params)).to eq([-1.0, 0])
  #   end
  # end

  describe "score" do
    it "should pass ocassion Birthday" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Birthday"}}
      recipe = {"occasions"=>"Birthday"}
      expect(job.score(recipe, params)).to eq([1.0, 1])
    end
  end

  describe "score" do
    it "should not pass ocassion Birthday" do
      params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Birthday"}}
      recipe = {"occasions"=>"fall"}
      expect(job.score(recipe, params)).to eq([-1.0, 0])
    end
  end

  # describe "score" do
  #   it "should pass time under 10 min" do
  #     params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}}
  #     recipe = {"readyInMinutes"=>10}
  #     expect(job.score(recipe, params)).to eq([1.0, 1])
  #   end
  # end

  # describe "score" do
  #   it "should not pass time under 10 min" do
  #     params = {"controller"=>"recipe", "action"=>"index", "recipe"=>{"cuisine"=>"Any", "diet"=>"Any", "occasion"=>"Any"}}
  #     recipe = {"readyInMinutes"=>30}
  #     expect(job.score(recipe, params)).to eq([-1.0, 0])
  #   end
  # end

  # describe "get_recipes" do
  #   it "should show recipes" do
  #     params = {}
  #     expect(job.get_recipes(params)).not_to be_nil
  #   end
  # end


  describe "get_similar_recipes" do
    it "should give similar_recipes" do
      id = 648345
      expect(job.get_similar_recipes(id)).not_to be_nil
    end
  end

  describe "get wine pairing" do
    it "should get no wine pairing" do
      id = 653775
      obj = job.get_recipe_info(id, false)

      expect(obj['winePairing']['productMatches']).to be_nil
    end

    it "should get wine pairings" do
      id = 648345
      obj = job.get_recipe_info(id, false)

      expect(obj['winePairing']['productMatches']).not_to be_nil
    end
  end


end

