Feature: approve or decline links

    as an admin
    so that I can manage the pending links
    I want to be able to approve or decline links

Background: user in database
  
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the user "bmk1995" is logged in
    
Scenario: pressing notification button
    When I am on the Links home page
    And I follow "noti"
    Then I should be on the admin page

Scenario: 
  When I am on the admin page
  Then I should see "Link Approval"
    