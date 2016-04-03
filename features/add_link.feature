Feature: add links to home page
  
  as a social entrepeneur
  so that I can add useful content to the page
  I want to be able to submit add link requests
  
Scenario: pressing add links button
  When I am on the Links home page
  And I press "Add Links"
  Then I should be on the Add Links page

Scenario: submitting a submit link form
  When I am on the Add Links page
  And I fill in "Name of Link" with "New Link"
  And I fill in "Full URL" with "google.com"
  And I fill in "Category" with "Jobs"
  And I press "Submit"
  Then I should see "Your request has been successfully submitted"
  And I should be on the Links home page
  
  