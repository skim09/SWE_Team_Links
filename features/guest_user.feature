Feature: Guest User
  
  As a 
  
Scenario: trying to request a link
  When I am on the Links home page
  And I follow "Request a Link"
  Then I should be on the Links home page
  And I should see "Must be logged in to add links"
