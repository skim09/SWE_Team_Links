Feature: report links
  
  as a social entrepeneur
  so that I can add useful content to the page
  I want to be able to submit add link requests

Background: links in database
  

  Given the following links exist:
  | name                | category                       | url                    | upvotes | status |
  | Boogle              | Get Acclimated & Get Inspired  | https://www.google.com | 5       | true   |
  | Acumen              | Get Acclimated & Get Inspired  | https://www.acumen.org | 6       | true   |


  And I am on the Links home page  


Scenario: pressing report link button
  When I am on the Links home page
  And I follow "Report a Link"
  Then I should be on the Report page

Scenario: submitting a report link form
  When I am on the Report page
  And I fill in "reportname" with "Boogle"
  And I choose "Broken Link"
  And I press "Report"
  Then I should be on the Links home page
  