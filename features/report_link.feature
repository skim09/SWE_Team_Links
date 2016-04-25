Feature: report links
  
  as a social entrepeneur
  so that I can add useful content to the page
  I want to be able to submit add link requests

Background: links in database
  
  Given the following links exist:
  
  | name                | category      | url |
  | Google              | Internships   | https://www.google.com |


  And I am on the Links home page  


Scenario: pressing report link button
  When I am on the Links home page
  And I follow "Report"
  Then I should be on the Report page

Scenario: submitting a report link form (happy path)
  When I am on the Report page
  And I select "Broken Link"
  And I press "Submit"
  Then I should be on the Links home page
  