Feature: Use can update ingredients 
Scenario: Update Ingredients
When I am on the ingredient page 
And I follow “Potato”
Then I should be on the detail page for “Potato”
And I fill in “Quantity”with 3
Then I press "Save Changes"
Then I should be on the ingredient page
And I should see “Quantity” of “Potato” with 3
