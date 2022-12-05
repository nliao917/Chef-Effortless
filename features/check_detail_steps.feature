Feature: Use can view detail and steps

Background: ingredients in database

  Given the following ingredients exist:
  | item   | quantity | expiration_date |
  | Potato |        2 |      2023-05-25 |
  | Tomato |        5 |      2022-12-25 |
  | Egg    |        2 |      2022-12-25 |
  | Beef   |        3 |      2022-12-25 |


Scenario: User can see details of recipe
Given I am on the recipe index page
And I follow "details"
Then I should see "Nutrition List"
And I should see "Back"

Scenario: User can see steps of recipe
Given I am on the recipe index page
And I follow "steps"
Then I should see "Step List"
And I should see "Wine pairing recommendations"
And I should see "Similar recipes"
And I should see "Back"

