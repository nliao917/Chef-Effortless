class Ingredient < ActiveRecord::Base
    # def self.find_ingredient(name)
    #     Ingredient.find_by_item(name)
    # end

	def self.find_quantity(name)
		return find_by_item(name).quantity 
	end
end
