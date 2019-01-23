Feature: As a user of riskIQ platform I want to create a project

  Background:
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"

  @createProject1
  Scenario: Check when i send an list of valid params, the response retrieve all the information related with the project created
    When users want to create project with the values
      | key        | value |
      | name | @random |
      | visibility  | public |
      | description | my project!  |
      | tags  | newproject, myownproject |
    Then the api should response with code 200
    And Response includes the following
      | visibility  | public |
      | owner  | riskiq |
      | active  | true |
      | description | my project!  |
      | subscribers | sim.gretina@example.org  |
      | creator | sim.gretina@example.org  |
      | guid | 82927c81-20c4-38dd-fcfc-bba3605e28e4  |
      | featured | false  |
      | collaborators |  |
      | name | My Public Project |
      | created | 2017-04-14T23:49:05.711977  |
      | organization | riskiq |
      | success | true  |
    And Check JSON schema "project/Create.json"