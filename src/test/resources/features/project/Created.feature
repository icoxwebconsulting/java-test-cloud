Feature: As a user of riskIQ platform I want to create a project

 @createProject
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created
   Given a valid user and key from riskIQ platform
   When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | public                   |
      | description | my project!              |
      | featured    | true                     |
      | tags        | newproject, myownproject |
    Then the api should response with code 200

  @createProject
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | public                   |
      | description | my project!              |
      | featured    | true                     |
      | tags        | newproject, myownproject |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an list of valid params with visibility private, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | private                  |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an list of valid params with visibility analyst, the response retrieve all the information related with the project created and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | analyst                  |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an list of valid params, with wrong credentials the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | public                   |
    Then the api should response with code 401
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send just a name params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send just a visibility params, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | visibility  | public                   |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an invalid visibility params, the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | other value              |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when I send an integer value in the visibility field, the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | PROJECT API              |
      | visibility  | 100                      |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  Scenario: Check when I send an integer value in the field name, the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to create project with the values
      | key         | value                    |
      | name        | 100                      |
      | visibility  | public                   |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  #Este Scenario lo creó Alejandro con fines de probar como obtener el UUID
  @createProject222
  Scenario: create a project
    When users want to create project with the values
      | key        | value |
      | name | My Public Project|
      | visibility  | public |
    Then the api should response with code 200
    And Response includes the following
      | name | My Public Project |
      | visibility  | public |
    Then get proyectUUID from project created