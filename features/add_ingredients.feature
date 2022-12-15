Feature: Use can delete an ingredients

Background: ingredients in database

  Given the following ingredients exist:
  | item   | quantity | expiration_date |
  | Potato |        2 |      2023-05-25 |
  | Tomato |        5 |      2022-12-25 |
  | Egg    |        0 |      2022-12-25 |
  | Beef   |        3 |      2022-12-25 |


Scenario: User can add ingredient
Given I am on the index page
And I follow "Add Ingredient"
Then I am on the new ingredient page

Scenario: User needs to have valid input
Given I am on the new ingredient page
And I press "Confirm"
Then I should see "Error - please input a valid name"

Scenario: User needs to add both name and quantity
Given I am on the new ingredient page
And I input with "Potato"
And I press "Confirm"
Then I should see "Error"