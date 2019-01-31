Feature: As a user of riskIQ platform I want to create a project

  @Create
  Scenario: Check when i send an list of valid params, with wrong credentials the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | public                       |
    Then the api should response with code 401
    And Check JSON schema "project/ErrorMessage.json"

  @Create
  Scenario: Check when i send an invalid visibility params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When  users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | other value                  |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Create
  Scenario: Check when I send an integer value in the visibility field, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When  users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | 100                          |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Create
  Scenario: Check when I send an integer value in the field name, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When  users want to create project with the values
      | key         | value                        |
      | name        | 100                          |
      | visibility  | public                       |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Create
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created
   Given a valid user and key from riskIQ platform
   When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | public                       |
      | description | @@description                |
      | featured    | true                         |
      | tags        | @@randomTags2                |
    Then the api should response with code 200

  @Create
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | public                       |
      | description | @@description                |
      | featured    | true                         |
      | tags        | @@randomTags3                |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @Create
  Scenario: Check when i send an list of valid params with visibility private, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | private                      |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @Create
  Scenario: Check when i send an list of valid params with visibility analyst, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
      | visibility  | analyst                      |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @Create
  Scenario: Check when i send just a name params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                        |
      | name        | @@namerandom                 |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"

  @Create
  Scenario: Check when i send just a visibility params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When  users want to create project with the values
      | key         | value                        |
      | visibility  | public                       |
    Then the api should response with code 400
    And Check JSON schema "project/ErrorMessage.json"
