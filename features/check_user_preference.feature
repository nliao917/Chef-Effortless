Feature: Use can update recipe preference

Scenario: Any cuisine style selected
Given I am on the recipe index page
And I fill in "Cuisine" with "Any"
And I press "Update User Preference"
Then I should see "..."
And I should not see "..."

Scenario: User can get fast-food recommendations
Given I am on the recipe index page
And I fill in "Time" with "under 20 min"
When I press "Update User Preference"
Then I should see "Ramen"
And I should see "Frozen dumplings"
But I should not see "Beijing Duck"
And I should not see "Buddha Jumps Over the Wall"

Scenario: User can see recipes based on dietary preferences
Given I am on the recipe index page
When I fill in "Diet" with "Vegan"
When I press "Update User Preference"
Then I should see "Salad"
And I should not see "Kongpao chicken"

Scenario: User can update intolerance 
Given I am on the recipe index page
And I fill in "Intolerance" with "Egg"
And I press "Update User Preference"
Then I should see "..."
And I should not see "..."

Scenario: User can go back to the index page
Given I am on the recipe index page
And I follow "Chef Effortless"
Then I should be on the index page