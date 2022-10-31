class Ingredient < ActiveRecord::Base
    def self.find_ingredient(name)
        Ingredient.find_by_item(name)
    end
end
