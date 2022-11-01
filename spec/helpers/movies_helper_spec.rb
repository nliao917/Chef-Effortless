require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RecipeHelper. For example:
#
# describe RecipeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MoviesHelper, type: :helper do
  describe "test movie helper" do
    it "equal odd" do
      v = oddness(1)
      expect(v).to eq("odd")
    end

    it "equal even" do
      v = oddness(2)
      expect(v).to eq("even")
    end
  end
end
