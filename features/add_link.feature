Feature: add links to home page
  
  as a social entrepeneur
  so that I can add useful content to the page
  I want to be able to submit add link requests

Background:
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the user "bmk1995" is logged in
  
Scenario: pressing add links button
  When I am on the Links home page
  And I follow "Add Link"
  Then I should be on the Add Links page

Scenario: submitting a submit link form (happy path)
  When I am on the Add Links page
  And I fill in "Name" with "New Link"
  And I fill in "Url" with "http://google.com"
  And I select "Internships" from "Category"
  And I press "Create Link"
  Then I should be on the Links home page
  
Scenario: submitting a submit link form (sad path)
  When I am on the Add Links page
  And I fill in "Name of Link" with "New Link"
  And I select "Internships" from "Category"
  And I press "Submit"
  Then I should see "url can't be blank"
  
  