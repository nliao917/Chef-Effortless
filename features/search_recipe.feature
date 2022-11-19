Feature: Use can search recipe based on name


Scenario: User can search pasta
Given I am on the index page
#And I fill in "Search" with "pasta"
#And I follow "Search"
#Then I should see "Pasta"


Scenario: User cannot search hello
Given I am on the index page
#And I fill in "OR I have recipe in mind" with "hello"
#And I follow "Search"
#Then I should see "Sorry"