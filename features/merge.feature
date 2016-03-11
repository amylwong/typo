Feature: Merge Articles
  As an user,
  I want to merge articles,
  so authors may write more than one article on the same topic and say similar things.

  Background:
    Given the blog is set up
    
  Scenario: A non-admin cannot merge articles
    Given I am not an admin
    And I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I follow "Foobar"
    Then I should not see "Merge Articles"
    
  Scenario: An admin can merge articles
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    And I follow "Foobar"
    Then I should see "Merge Articles"

  Scenario: When articles are merged, the merged article should 
    contain the text of both previous articles.
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "Foo"
    And I fill in "article__body_and_extended_editor" with "foo"
    And I press "Publish"
    Then I should be on the admin content page
    
    When I am on the new article page
    When I fill in "article_title" with "Bar"
    And I fill in "article__body_and_extended_editor" with "bar"
    And I press "Publish"
    Then I should be on the admin content page
    
    When I follow "Foo"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "001"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Foo"
    And I follow "Foo" 
    And I should see "bar"
   
   
  Scenario: When articles are merged, the second article should not exist
    Given I am logged into the admin panel
    And I am on the new article page
    When I fill in "article_title" with "Foo"
    And I fill in "article__body_and_extended_editor" with "foo"
    And I press "Publish"
    Then I should be on the admin content page
    
    When I am on the new article page
    When I fill in "article_title" with "Banelings"
    And I fill in "article__body_and_extended_editor" with "bar"
    And I press "Publish"
    Then I should be on the admin content page
    
    When I follow "Foo"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "001"
    And I press "Merge"
    Then I should be on the admin content page
    And I follow "Banelings"
   
  # Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).
  #   Given I am logged into the admin panel
  #   And I am on the new article page
  #   When I fill in "article_title" with "Foo"
  #   And I fill in "article__body_and_extended_editor" with "foo"
  #   And I press "Publish"
  #   Then I should be on the admin content page
    
  #   Given I am not an admin
  #   And I am on the new article page
  #   When I fill in "article_title" with "Bar"
  #   And I fill in "article__body_and_extended_editor" with "bar"
  #   And I press "Publish"
  #   Then I should be on the admin content page
    
  #   Given I am logged into the admin panel
  #   And I am on the admin content page
  #   When I follow "Foo"
    