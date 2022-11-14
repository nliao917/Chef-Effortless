Feature: Use can update recipe preference

Background: ingredients in database

  Given the following ingredients exist:
  | item   | quantity | expiration_date |
  | Potato |        2 |      2023-05-25 |
  | Tomato |        5 |      2022-12-25 |
  | Egg    |        2 |      2022-12-25 |
  | Beef   |        3 |      2022-12-25 |


Scenario: Any cuisine style selected
Given I am on the recipe index page
#Then I should see "Corned Beef Cakes"
Then I should see "Albondigas"
And I should not see "Beijing Duck"

Scenario: User can get fast-food recommendations
Given I am on the recipe index page
And I fill in "Time" with "under 50 min"
When I press "Update User Preference"
Then I should see "Mexican Stuffed Potatoes"
But I should not see "Beijing Duck"
And I should not see "Buddha Jumps Over the Wall"

Scenario: User can see recipes based on dietary preferences
Given I am on the recipe index page
#When I fill in "Diet" with "Vegan"
When I fill in "Diet" with "dairy free"
When I press "Update User Preference"
Then I should see "Albondigas"
And I should not see "Kongpao chicken"

Scenario: User can update intolerance 
Given I am on the recipe index page
#And I fill in "Intolerance" with "Egg"
And I fill in "Occasion" with "winter"
And I press "Update User Preference"
Then I should see "Albondigas"
And I should not see "Kongpao chicken"

Scenario: User can go back to the index page
Given I am on the recipe index page
And I follow "Chef Effortless"
Then I should be on the index page

