Feature: Use can search recipe based on name


Scenario: User can search pasta
Given I am on the index page
And I input with "pasta"
And I press "Search Recipe in Mind"
Then I should see "Recipe Details"


Scenario: User cannot search hello
Given I am on the index page
And I input with "hello"
And I press "Search Recipe in Mind"
