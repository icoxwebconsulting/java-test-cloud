Feature: As a user of riskIQ platform I want to delete a project


  @Delete
  Scenario: Check when i want to delete a project, with wrong credentials the response retrieve error message and code error and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a invalid user and invalid key from riskIQ platform
    When users want to delete project with the values
      | key     | value  |
      | project | ##guid |
    Then the api should response with code 401
    And Check JSON schema "project/ErrorMessage.json"

  @Delete
  Scenario: Check when i want to delete a project, the response retrieve all the information related with the project deleted
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project with the values
      | key     | value  |
      | project | ##guid |
    Then the api should response with code 200

  @Delete
  Scenario: Check when i want to delete a project, the response retrieve all the information related with the project deleted and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project with the values
      | key     | value  |
      | project | ##guid |
    Then the api should response with code 200
    And Check JSON schema "project/Delete.json"

  @Delete
  Scenario: Check when i want to delete a project with GUID project not existent, the response retrieve error message and code error and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete a project with guid not existent
      | key     | value  |
      | project | ##guid |
    Then the api should response with code 404
    And Check JSON schema "project/ErrorMessage.json"

  @Delete
  Scenario: Check when i want to delete a project with invalid format GUID project, the response retrieve error message and code error and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project with the values
      | key     | value  |
      | project | @@guid |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Delete
  Scenario: Check when i want to delete a project without GUID project params, the response retrieve error message and code error and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project without values
    Then the api should response with code 400
    And Check JSON schema "project/ServerUnderstand.json"

  @Delete
  Scenario: Check when i want to delete a project with empty GUID project, the response retrieve error message and code error and check with Json schema
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project with the values
      | key     | value |
      | project |       |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Delete
  Scenario: Check when a user A want to delete a project created by user B,response retrieve error message and code 403
  error and check with Json schema
    Given a created project with values by user B
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    When users want to delete project with the values
      | key     | value |
      | project |  ##guid     |
    Then the api should response with code 403
    And Check JSON schema "project/ErrorMessage.json"


