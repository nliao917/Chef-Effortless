# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


ingredients = [{:user_id => 1, :item => 'Potato', :quantity => '5', :expiration_date => DateTime.new(2022,12,15,17)},
          {:user_id => 1, :item => 'Tomato', :quantity => '4', :expiration_date => DateTime.new(2022,12,9,17)},
          {:user_id => 1, :item => 'Rice', :quantity => '10', :expiration_date => DateTime.new(2022,9,11,13)},
          {:user_id => 1, :item => 'Beef', :quantity => '2', :expiration_date => DateTime.new(2022,10,12,17)},
          {:user_id => 1, :item => 'Tofu', :quantity => '6', :expiration_date => DateTime.new(2022,11,1,17)},
          {:user_id => 1, :item => 'Cheese', :quantity => '1', :expiration_date => DateTime.new(2022,12,1,15)},
          {:user_id => 1, :item => 'Bread', :quantity => '8', :expiration_date => DateTime.new(2022,11,1,8)},
          {:user_id => 1, :item => 'Eggs', :quantity => '13', :expiration_date => DateTime.new(2023,1,12,17)},
          {:user_id => 1, :item => 'Milk', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Butter', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cauliflower', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Olive Oil', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Garlic', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Red Pepper Flakes', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Pasta', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Salt', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Pepper', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Scallions', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'White Wine', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Whole Wheat Bread Crumbs', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Sugar', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Nuts', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Ketchup', :quantity => '12', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :user_id => 1, :item => 'Chocolate', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Corn', :quantity => '8', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Butter', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Almonds', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Baking Powder', :quantity => '14', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Apple Juice', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Chicken', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Apple', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Asparagus', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Beans', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Celery', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Carrots', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cabbage', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Brussels Sprouts', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Broccoli', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cherries', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cilantro', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cranberries', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Cucumber', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Egglant', :quantity => '14', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Green Beans', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Herbs ans Spices', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Kale', :quantity => '1', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Kiwi', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Mangos', :quantity => '5', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Mushrooms', :quantity => '9', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Oats', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Onions', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Oranges', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Pears', :quantity => '9', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Pork', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Pumpkin', :quantity => '4', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Salmon', :quantity => '3', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Spinach', :quantity => '2', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Turkey', :quantity => '6', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Tuna', :quantity => '7', :expiration_date => DateTime.new(2022,12,28,10)},
          {:user_id => 1, :item => 'Strawberries', :quantity => '10', :expiration_date => DateTime.new(2022,12,28,10)},
          ]


users = [ {:email => 'test1@gmail.com', :password => 'password1'}
]

ingredients.each do |ingredient|
  Ingredient.create!(ingredient)
end


users.each do |user|
    User.create!(user)
end


