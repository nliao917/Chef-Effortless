# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


ingredients = [{:item => 'Potato', :quantity => '5', :expiration_date => DateTime.new(2009,9,1,17)},
          {:item => 'Tomato', :quantity => '4', :expiration_date => DateTime.new(2022,12,9,17)},
          {:item => 'Rice', :quantity => '10', :expiration_date => DateTime.new(2022,9,11,13)},
          {:item => 'Beef', :quantity => '2', :expiration_date => DateTime.new(2022,10,12,17)},
          {:item => 'Tofu', :quantity => '6', :expiration_date => DateTime.new(2022,11,1,17)},
          {:item => 'Cheese', :quantity => '1', :expiration_date => DateTime.new(2022,12,1,15)},
          {:item => 'Bread', :quantity => '8', :expiration_date => DateTime.new(2022,11,1,8)},
          {:item => 'Eggs', :quantity => '13', :expiration_date => DateTime.new(2023,1,12,17)},
          {:item => 'Milk', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Butter', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cauliflower', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Olive Oil', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Garlic', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Red Pepper Flakes', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Pasta', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Salt', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Pepper', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Scallions', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'White Wine', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Whole Wheat Bread Crumbs', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Sugar', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Nuts', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Ketchup', :quantity => '12', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Chocolate', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Corn', :quantity => '8', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Butter', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Almonds', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Baking Powder', :quantity => '14', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Apple Juice', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Chicken', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Apple', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Asparagus', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Beans', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Celery', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Carrots', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cabbage', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Brussels Sprouts', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Broccoli', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cherries', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cilantro', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cranberries', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Cucumber', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Egglant', :quantity => '14', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Green Beans', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Herbs ans Spices', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Kale', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Kiwi', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Mangos', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Mushrooms', :quantity => '9', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Oats', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Onions', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Oranges', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Pears', :quantity => '9', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Pork', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Pumpkin', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Salmon', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Spinach', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Turkey', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Tuna', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Strawberries', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:item => 'Yogurt', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)}
          
  	 ]

ingredients.each do |ingredient|
  Ingredient.create!(ingredient)
end



