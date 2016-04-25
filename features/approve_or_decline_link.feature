Feature: approve or decline links

    as an admin
    so that I can manage the pending links
    I want to be able to approve or decline links

Background: user in database
  
  Given the following user exists:
  
  | name                | admin |
  | Yiming Liu              | t|
    
Scenario: pressing notification button
    When I am on the Links home pager
    And I press "noti"
    Then I should be on the admin page
    