# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


ingredients = [{:item => 'Potato', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Tomato', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Rice', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Beef', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Tofu', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Cheese', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Bread', :quantity => '1', :expiration_date => 'Seven days later'},
          {:item => 'Egg', :quantity => '1', :expiration_date => 'Seven days later'}
  	 ]

ingredients.each do |ingredient|
  Ingredient.create!(ingredient)
end



