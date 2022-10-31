Feature: Use can check ingredients

Background: ingredients in database

  Given the following ingredients exist:
  | item   | quantity | expiration_date |
  | Potato |        2 |      2023-05-25 |
  | Tomato |        5 |      2022-12-25 |
  | Egg    |        0 |      2022-12-25 |
  | Beef   |        3 |      2022-12-25 |

 
Scenario: Check current ingredients
Given I am on the index page
When I follow "Ingredient"
Then I should be on the ingredients page
And I should see "Potato"
And I should not see "Cloth"

Scenario: Get recommendation
Given I am on the index page
When I follow "Create Recipe"
Then I should be on the recipe index page
Then I should see "Beef over Potato"
And I should not see "Scambled Egg"

Scenario: Update Ingredients
When I am on the ingredients page 
And I follow "More about Potato"
Then I should be on the edit page for "Potato"
And I fill in "Quantity" with "3"
Then I press "Update Ingredient Info"
And I follow "Back to List"
Then I should be on the ingredients page