Feature: add links to home page
  
  as a social entrepeneur
  so that I can add useful content to the page
  I want to be able to submit add link requests

Background:
  Given the following users exist:
  | name        | admin         |
  | ethbaby     | true          |
  | not_ethbaby | false         |
  
  And the non-admin "not_ethbaby" is logged in
  
Scenario: pressing add links button
  When I am on the Links home page
  And I follow "Request"
  Then I should be on the Add Links page

Scenario: submitting a submit link form as non-admin (happy path)
  When I am on the Add Links page
  And I fill in "link_name" with "New Link"
  And I fill in "link_url" with "http://google.com"
  And I select "Get Acclimated & Get Inspired" from "link_category"
  And I press "Request"
  Then I should be on the Links home page
  And I should not see "New Link"

Scenario: submitting a submit link form as admin (happy path)
  When the admin "eth_baby" is logged in
  When I am on the Add Links page
  And I fill in "link_name" with "New Link"
  And I fill in "link_url" with "http://google.com"
  And I select "Get Acclimated & Get Inspired" from "link_category"
  And I press "Request"
  Then I should be on the Links home page
  And I should see "New Link"
  
Scenario: submitting a submit link form (sad path)
  When I am on the Add Links page
  And I fill in "link_name" with "New Link"
  And I select "Get Smart & Get Informed" from "link_category"
  And I press "Request"
  Then I should see "url can't be blank"
  
  