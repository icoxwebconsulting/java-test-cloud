Feature: As a user of riskIQ platform I want to create a project

  Background:
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"

  @createProject
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created
    When users want to create project with the values
      | key        | value |
      | name | My Project from idea |
      | visibility  | public |
      | description | my project!  |
      | featured | true  |
      | tags  | newproject, myownproject |
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an list of valid params, with wrong credentials the response retrieve error message and code error
    When users want to create project with the values
      | key        | value |
      | name | @random |
      | visibility  | public |
    Then the api should response with code 401
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send just a name params, the response retrieve error message and code error
    When users want to create project with the values
      | key        | value |
      | name | @random |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send just a visibility params, the response retrieve error message and code error
    When users want to create project with the values
      | key        | value |
      | visibility  | public |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an invalid visibility params, the response retrieve error message and code error
    When users want to create project with the values
      | key        | value |
      | name | @random |
      | visibility  | other value |
    Then the api should response with code 400
    And Check JSON schema "project/Create.json"

  @createProject
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created
    When users want to create project with the values
      | key        | value |
      | name | @random |
      | visibility  | public |
      | description | my project!  |
      | featured | true  |
      | tags  | newproject, myownproject |
    Then the api should response with code 200
    And Response includes the following
      | visibility  | public |
      | description | my project!  |
      | featured | true  |
      | name | @random |
      | tags  | newproject, myownproject |
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