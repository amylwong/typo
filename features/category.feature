Feature:
As an admin,
I want to use categories,
so I can create and edit them.
Background:
    Given the blog is set up
    And I am logged into the admin panel
    
Scenario:
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the Categories page

