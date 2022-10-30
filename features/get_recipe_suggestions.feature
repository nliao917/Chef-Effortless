Feature: User can see recipe suggestions
Scenario: Get recommendation
Given I am on the index page
When I press “Customize my recipe”
Then I should be on the recipe page
And I should see a list of recipes