Feature: As a user of riskIQ platform I want to delete a project

  @delete
  Scenario: Check when i want to delete a project, the response retrieve all the information related with the project deleted
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists with values
      | key        | value |
      | name | My Public Project 20|
      | visibility  | public |
    When users want to delete project with the values
      | key     | value  |
      | project | @@guid |
    Then the api should response with code 200
  #And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project, with wrong credentials the response retrieve error message and code error
    Given A user with user "email@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists with values
      | key        | value |
      | name | My Public Project 21|
      | visibility  | public |
    When users want to delete project with the values
      | key     | value  |
      | project | @@guid |
    Then the api should response with code 401
  #And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project with invalid GUID project, the response retrieve error message and code error
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 22|
      | visibility  | public |
    When users want to delete project with the values
      | key     | value  |
      | project | WrongGuid |
    Then the api should response with code 404
    #And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project without GUID project params, the response retrieve error message and code error
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 23|
      | visibility  | public |
    When users want to delete project without values
    Then the api should response with code 400
    #And Check JSON schema jsonSchema/schema.json

  @delete
  Scenario: Check when i want to delete a project with empty GUID project, the response retrieve error message and code error
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 24|
      | visibility  | public |
    When users want to delete project with the values
      | key     | value  |
      | project |  |
    Then the api should response with code 400
    #And Check JSON schema jsonSchema/schema.json

