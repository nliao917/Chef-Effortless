Feature: Use can delete an ingredients

Background: ingredients in database

  Given the following ingredients exist:
  | item   | quantity | expiration_date |
  | Potato |        2 |      2023-05-25 |
  | Tomato |        5 |      2022-12-25 |
  | Egg    |        0 |      2022-12-25 |
  | Beef   |        3 |      2022-12-25 |


Scenario: Any ingredient deleted
Given I am on the ingredients page
And I press "Delete"
Then I am on the ingredients page
And I should not see "Potato"
