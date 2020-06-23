@plant_search
Feature: Oakland Plant Search

  Background:
    Given user is on plant search page

  @smoke
  Scenario: Verify the user can search for the plant
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the search results count is not more than 15

  @regression
  Scenario Outline: Verify the user can search for different plants
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search results count is not more than <no_of_results>
    Examples:
      | plant_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 15            |

  @jira-345
  Scenario Outline: Verify the user can search for different plants with details
    When user search for the plant <plant_name>
    Then user should see the results related to <plant_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the plant
      | plant_details |
      | Plant Type    |
      | Plant Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |
    Examples:
      | plant_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |


  Scenario: Verify user can add the plants to wish list
    When user search for the plant Rose
    And user add the first result to the wish list
    Then verify the added plant is showing under wish list page
#    Then verify the Chater's Double Rose Pink Hollyhock plant is showing under wish list page

  Scenario: Verify user can modify the item quantity in the wish list
    When user search for the plant Rose
    And user add the first result to the wish list
    And user modifies the quantity of the wish list item
    Then verify user can see the updated quantity

#    Imperative style
  Scenario: Verify user can modify the item quantity in the wish list using imperative style
    Then user can modify the quantity in the wish list

  Scenario: verify the user can empty the wish list
    When user adds the plant Rose to the wish list
    And user empty the wish list
    Then user should see the confirmation message "Your Wish List is currently empty!"

  Scenario: Get the plant search details - Plant Type, Plant Height, Flower Height, Spread and Sunlight
    When user search for the plant Rose
    Then user should see the results related to Rose
    And get the details of the plant

  Scenario: Verify the plant search details - Plant Type, Plant Height, Flower Height, Spread and Sunlight are correct
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the details of the plant
      | plant_details | plant_value |
      | Plant Type    | perennial   |
      | Plant Height  | 4 feet      |
      | Flower Height | 6 feet      |
      | Spread        | 24 inches   |
      | Sunlight      | full sun    |

  Scenario: verify the yml test data functionality
    When user verifies data can be read from yml file

  Scenario: Verify the plant search details - Plant Type, Plant Height, Flower Height, Spread and Sunlight are correct using yml
    When user search for the plant Rose
    Then user should see the results related to Rose
    And verify the details of the Rose are correct

  @wip
  Scenario: to do test
    When fdjfklasfjsd