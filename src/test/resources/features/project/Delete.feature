Feature: As a user of riskIQ platform I want to delete a project

  @delete
  Scenario: Check when i want to delete a project, the response retrieve all the information related with the project deleted
    Given a valid user and key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project with the values
      | key        | value         |
      | project    | @@guid        |
    Then the api should response with code 200

  @delete
  Scenario: Check when i want to delete a project, the response retrieve all the information related with the project deleted and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project with the values
      | key        | value         |
      | project    | @@guid        |
    Then the api should response with code 200
    And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project, with wrong credentials the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project with the values
      | key        | value         |
      | project    | @@guid        |
    Then the api should response with code 401
    And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project with invalid GUID project, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project with the values
      | key        | value         |
      | project    | WrongGuid     |
    Then the api should response with code 404
    And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project without GUID project params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project without values
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project with empty GUID project, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | PROJECT API   |
      | visibility | public        |
    When users want to delete project with the values
      | key     | value  |
      | project |        |
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

