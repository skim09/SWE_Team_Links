Feature: approve or decline links

    as an admin
    so that I can manage the pending links
    I want to be able to approve or decline links
    
Scenario: pressing notification button
    When I am on the Links home page
    And I press "noti"
    Then I should be on the admin page
    