//Feature: As a user of riskIQ platform I want to see a project or projects using search criteria

//  @findProjectTest1
//  Scenario: Check the response of find all projects when i search all project that exist in riskIQ platform is a 200
//    Given a valid user from riskIQ platform
//    When users want to get information of the all project
//    Then the api should response with code 200

//  @findProjectTest1
//  Scenario: Check when i send an invalid Owner project, the response retrieve error message and code error and check with json schema
//    Given a valid user from riskIQ platform
//    And a created project with values
//      | key          | value                  |
//      | name         | @@namerandom           |
//      | visibility   | public                 |
//      | owner        | @@nameowner            |
//    When users want to get information on the project with the values
//      | key          | value                  |
//      | owner        | @@wrongnameowner       |
//    Then the api should response with code 400