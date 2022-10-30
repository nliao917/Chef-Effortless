Feature: Use can check ingredients 
Scenario: Check current ingredients
Given I am on the index page
When I follow "Check your ingredient”
Then I should be on the Ingredients page
And I should see “Potato”
And I should not see “Cloth”
