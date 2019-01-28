Feature: As a user of riskIQ platform I want to see a project or projects using search criteria

  @findProject
  Scenario: Check the response of find all projects when i search all project that exist in riskIQ platform is a 200
    Given a valid user from riskIQ platform
    When users want to get information of the all project
    Then the api should response with code 200


  @findProject
  Scenario: Check the response of find all projects when i search all project that exist in riskIQ platform is a 200 and check
  with json schema
    Given a valid user from riskIQ platform
    When users want to get information of the all project
    Then the api should response with code 200
    And Check JSON schema "project/Create.json"

  @findProject
  Scenario: Check the response of find all projects , with wrong credentials retrieve error message 401 and check
  with json schema
    Given a invalid user from riskIQ platform
    When users want to get information of the all project
    Then the api should response with code 401
    And Check JSON schema "project/InvalidCredentials.json"

  @findProject222
  Scenario: Check the response of find project when i search a project that exist in riskIQ platform is a 200 and
  the number of projects should be equal to 1
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value         |
      | name       | @@nameproject |
      | visibility | public        |
      | owner      | passivetotal  |
    When users want to get information of the project by id
    Then the api should response with code 200
    And the number of projects should be equal to 1

  @findProject
  Scenario: Check the response of find project by GUID  with wrong credentials the response retrieve error message and code error 401 and
  check with json schema
    Given a created project with values
      | key        | value        |
      | name       | PROJECT API  |
      | visibility | public       |
      | owner      | passivetotal |
    And a invalid user from riskIQ platform
    When users want to get information of the project by id
    Then the api should response with code 401
    And Check JSON schema "project/InvalidCredentials.json"

  @findProject
  Scenario: Check when i send an invalid GUID project, the response retrieve error message and code 400 error
    Given a valid user from riskIQ platform
    When users want to get information on the project with the values
      | key     | value  |
      | project | asdsad |
    Then the api should response with code 400
    And Check JSON schema "project/InvalidGUID.json"

  @findProject
  Scenario: Check when i send an not exist GUID project, the response retrieve error message and code 404 error
    Given a valid user from riskIQ platform
    When users want to get information on the project with the values
      | key     | value                                |
      | project | 285cbfa2-9e97-0cb9-d2bc-995bca7c5940 |
    Then the api should response with code 404
    And Check JSON schema "project/NoProjectWithThatID.json"

  @findProject
  Scenario: Check when i send an specific Owner project, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | owner      | testcloud   |
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 200
    And the number of projects should be greater than 1

  @findProject
  Scenario: Check when i send an specific Owner project, the response retrieve all the information related with the project searched and
  code 200 and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | owner      | testcloud   |
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 200
    And Check JSON schema jsonSchema/schema.json

  @findProject
  Scenario: Check when i send an specific Owner project with wrong credentials the response retrieve error message and code error and check with json schema
    Given a created project with values
      | key        | value        |
      | name       | PROJECT API  |
      | visibility | public       |
      | owner      | passivetotal |
    And a invalid user from riskIQ platform
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 401

  @find
  Scenario: Check when i send an invalid Owner project, the response retrieve error message and code error and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value        |
      | name       | PROJECT API  |
      | visibility | public       |
      | owner      | passivetotal |
    When users want to get information on the project with the values
      | key   | value      |
      | owner | valueWrong |
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific Creator project, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value            |
      | name       | PROJECT API      |
      | visibility | public           |
      | creator    | robertm@icox.com |
    When users want to get information on the project with the values
      | key     | value            |
      | creator | robertm@icox.com |
    Then the api should response with code 200
    And the number of projects should be greater than 1
    And the number of projects should be equal to 2

  @find
  Scenario: Check when i send an specific Creator project, the response retrieve all the information related with the project searched and
  code 200 and check JSON schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value            |
      | name       | PROJECT API      |
      | visibility | public           |
      | creator    | robertm@icox.com |
    When users want to get information on the project with the values
      | key     | value            |
      | creator | robertm@icox.com |
    Then the api should response with code 200
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific Creator project with wrong credentials the response retrieve error message and code 401 error and check with json schema
    Given a created project with values
      | key        | value            |
      | name       | PROJECT API      |
      | visibility | public           |
      | creator    | robertm@icox.com |
    And a invalid user from riskIQ platform
    When users want to get information on the project with the values
      | key     | value            |
      | creator | robertm@icox.com |
    Then the api should response with code 401

  @find
  Scenario: Check when i send an invalid Creator project, the response retrieve error message and code 400 error and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value            |
      | name       | PROJECT API      |
      | visibility | public           |
      | creator    | robertm@icox.com |
    When users want to get information on the project with the values
      | key     | value               |
      | creator | emailwrong@icox.com |
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific organization, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key          | value       |
      | name         | PROJECT API |
      | visibility   | public      |
      | organization | testcloud   |
    When users want to get information on the project with the values
      | key          | value     |
      | organization | testcloud |
    Then the api should response with code 200
    And the number of projects should be greater than 1

  @find
  Scenario: Check when i send an specific organization, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key          | value       |
      | name         | PROJECT API |
      | visibility   | public      |
      | organization | testcloud   |
    When users want to get information on the project with the values
      | key          | value     |
      | organization | testcloud |
    Then the api should response with code 200
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific organization with wrong credentials the response retrieve error message and code 401 error and check with json schema
    Given a created project with values
      | key          | value       |
      | name         | PROJECT API |
      | visibility   | public      |
      | organization | testcloud   |
    And a invalid user from riskIQ platform
    When users want to get information on the project with the values
      | key          | value     |
      | organization | testcloud |
    Then the api should response with code 401

  @find
  Scenario: Check when i send an invalid organization, the response retrieve error message and code 400 error and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key          | value       |
      | name         | PROJECT API |
      | visibility   | public      |
      | organization | testcloud   |
    When users want to get information on the project with the values
      | key          | value      |
      | organization | valueWrong |
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an public visibility param, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value  |
      | visibility | public |


  @find
  Scenario: Check when i send an private visibility param, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | private     |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value   |
      | visibility | private |

  @find
  Scenario: Check when i send an analyst visibility param, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | analyst     |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value   |
      | visibility | analyst |

  @find
  Scenario: Check when i send an public visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value  |
      | visibility | public |
    Then the api should response with code 200
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an private visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | private     |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value   |
      | visibility | private |
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an analyst visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | analyst     |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | key        | value   |
      | visibility | analyst |
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific visibility with wrong credentials the response retrieve error message and code error and check with json schema
    Given a created project with values
      | key          | value       |
      | name         | PROJECT API |
      | visibility   | public      |
      | organization | testcloud   |
    And a invalid user from riskIQ platform
    When users want to get information of the project by id
    Then the api should response with code 401
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an invalid visibility, the response retrieve error message and code error and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
    When users want to get information of the project by id
      | key        | value      |
      | visibility | valueWrong |
    Then the api should response with code 400
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send feature: true, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | true        |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | true        |


  @find
  Scenario: Check when i send feature: false, the response retrieve all the information related with the project searched
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | false       |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | false       |

  @find
  Scenario: Check when i send feature: true, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | true        |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | true        |
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send feature: false, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user from riskIQ platform
    And a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | false       |
    When users want to get information of the project by id
    Then the api should response with code 200
    And Response includes the following
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | false       |
    And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific feature with wrong credentials the response retrieve error message and code error and check with json schema
    Given a created project with values
      | key        | value       |
      | name       | PROJECT API |
      | visibility | public      |
      | featured   | false       |
    And a invalid user from riskIQ platform
    When users want to get information of the project by id
    Then the api should response with code 401
    And Check JSON schema jsonSchema/schema.json

