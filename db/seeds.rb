# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


ingredients = [{:item => 'Potato', :quantity => '1', :expiration_date => DateTime.new(2009,9,1,17)},
          {:item => 'Tomato', :quantity => '1', :expiration_date => DateTime.new(2022,12,9,17)},
          {:item => 'Rice', :quantity => '1', :expiration_date => DateTime.new(2022,9,11,13)},
          {:item => 'Beef', :quantity => '1', :expiration_date => DateTime.new(2022,10,12,17)},
          {:item => 'Tofu', :quantity => '1', :expiration_date => DateTime.new(2022,11,1,17)},
          {:item => 'Cheese', :quantity => '1', :expiration_date => DateTime.new(2022,12,1,15)},
          {:item => 'Bread', :quantity => '1', :expiration_date => DateTime.new(2022,11,1,8)},
          {:item => 'Egg', :quantity => '1', :expiration_date => DateTime.new(2023,1,12,17)}
  	 ]

ingredients.each do |ingredient|
  Ingredient.create!(ingredient)
end



