Feature: As a user of riskIQ platform I want to see a project or projects using search criteria
  Background:
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    And a project that already exists with values
      | key        | value |
      | name | My Public Project |
      | visibility  | public |
  @find
  Scenario: Check when i search all projects, the response retrieve all the information related with the projects
  Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information of the all project
    Then the api should response with code 200
    And the number of projects should be greater than 1

  #all projects without params and chek Json schema
  @find
  Scenario: Check when i search all projects, the response retrieve all the information related with the projects and check with json schema
    Given A user with user "robertm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information of the all project
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json

  #all projects without params, invalid credentials and chek Json schema
  @find
  Scenario: Check when i search all projects, with wrong credentials the response retrieve error message and code error
    Given A user with user "email@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information of the all project
    Then the api should response with code 401
    #And Check JSON schema jsonSchema/schema.json

  #all projects with UUID params
  @find
  Scenario: Check when i send an specific GUID project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
    | key     | value  |
    | project | @project_id |
    Then the api should response with code 200
    #And the number of projects should be equal to 1

  #all projects with UUID params
  @find
  Scenario: Check when i send an specific GUID project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key     | value  |
      | project | @project_id |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json

  #all projects with UUID params, invalid credentials and chek Json schema
  @find
  Scenario: Check when i send an specific GUID project with wrong credentials the response retrieve error message and code error
    Given A user with user "email@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information on the project with the values
      | key     | value  |
      | project | @project_id |
    Then the api should response with code 401
    #And Check JSON schema jsonSchema/schema.json

  #all projects with invalid UUID params and chek Json schema
  @find
  Scenario: Check when i send an invalid GUID project, the response retrieve error message and code error
    When users want to get information on the project with the values
      | key     | value  |
      | project | 285cbfa2-9e97-0cb9-d2bc-995bca7c5940 |
    Then the api should response with code 404
    #And Check JSON schema jsonSchema/schema.json


#  #Owner
  @find
  Scenario: Check when i send an specific Owner project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 200
    And the number of projects should be greater than 1
    And the number of projects should be equal to 2

  @find
  Scenario: Check when i send an specific Owner project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific Owner project with wrong credentials the response retrieve error message and code error
    Given A user with user "robertmm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information on the project with the values
      | key   | value     |
      | owner | testcloud |
    Then the api should response with code 401

  #Este scenario debe resultar en codigo 400 pero resulta en codigo 200, es un error
  @find
  Scenario: Check when i send an invalid Owner project, the response retrieve error message and code error
    When users want to get information on the project with the values
      | key   | value     |
      | owner | valueWrong |
    Then the api should response with code 400
    #And Check JSON schema jsonSchema/schema.json

#  Creator
  @find
  Scenario: Check when i send an specific Creator project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value        |
      | creator | robertm@icox.com |
    Then the api should response with code 200
    And the number of projects should be greater than 1
    And the number of projects should be equal to 2

  @find
  Scenario: Check when i send an specific Creator project, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value        |
      | creator | robertm@icox.com |
    Then the api should response with code 200
   #And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific Creator project with wrong credentials the response retrieve error message and code error
  Given A user with user "robertmm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information on the project with the values
      | key   | value        |
      | creator | robertm@icox.com |
    Then the api should response with code 401

  #Este scenario debe resultar en codigo 400 pero resulta en codigo 200, es un error
  @find
  Scenario: Check when i send an invalid Creator project, the response retrieve error message and code error
    When users want to get information on the project with the values
      | key   | value        |
      | creator | emailwrong@icox.com |
    Then the api should response with code 400
   #And Check JSON schema jsonSchema/schema.json

  #organization
  @find
  Scenario: Check when i send an specific organization, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value        |
      | organization | testcloud |
    Then the api should response with code 200
    And the number of projects should be greater than 1
    And the number of projects should be equal to 2

  @find
  Scenario: Check when i send an specific organization, the response retrieve all the information related with the project searched
    When users want to get information on the project with the values
      | key   | value        |
      | organization | testcloud |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json

  @find
  Scenario: Check when i send an specific organization with wrong credentials the response retrieve error message and code error
    Given A user with user "robertmm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    When users want to get information on the project with the values
      | key   | value        |
      | organization | testcloud |
    Then the api should response with code 401

  #Este scenario debe resultar en codigo 400 pero resulta en codigo 200, es un error
  @find
  Scenario: Check when i send an invalid organization, the response retrieve error message and code error
    When users want to get information on the project with the values
      | key   | value     |
      | organization | valueWrong |
    Then the api should response with code 400
    #And Check JSON schema jsonSchema/schema.json

  #Visibility
  @find
  Scenario: Check when i send an public visibility param, the response retrieve all the information related with the project searched
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 7|
      | visibility  | public |
    When users want to get information on the project with the values
      | key   | value       |
      | visibility | public |
    Then the api should response with code 200
  @find
  Scenario: Check when i send an private visibility param, the response retrieve all the information related with the project searched
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 8|
      | visibility  | private |
    When users want to get information on the project with the values
      | key   | value        |
      | visibility | private |
    Then the api should response with code 200
  @find
  Scenario: Check when i send an analyst visibility param, the response retrieve all the information related with the project searched
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 9|
      | visibility  | analyst |
    When users want to get information on the project with the values
      | key   | value        |
      | visibility | analyst |
    Then the api should response with code 200
  @find
  Scenario: Check when i send an public visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 10|
      | visibility  | public |
    When users want to get information on the project with the values
      | key   | value       |
      | visibility | public |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send an private visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 11|
      | visibility  | private |
    When users want to get information on the project with the values
      | key   | value        |
      | visibility | private |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send an analyst visibility param, the response retrieve all the information related with the project searched and check with json schema
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 12|
      | visibility  | analyst |
    When users want to get information on the project with the values
      | key   | value        |
      | visibility | analyst |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send an specific visibility with wrong credentials the response retrieve error message and code error
    Given A user with user "robertmm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 13|
      | visibility  | public |
    When users want to get information on the project with the values
      | key   | value       |
      | visibility | public |
    Then the api should response with code 401
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send an invalid visibility, the response retrieve error message and code error
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 14|
      | visibility  | public |
    When users want to get information on the project with the values
      | key   | value        |
      | visibility | valueWrong |
    Then the api should response with code 400
    #And Check JSON schema jsonSchema/schema.json

  #Feature
  @find
  Scenario: Check when i send feature: true, the response retrieve all the information related with the project searched
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 15|
      | visibility  | public |
      | featured | true |
    When users want to get information on the project with the values
      | key   | value  |
      | featured | true |
    Then the api should response with code 200
  @find
  Scenario: Check when i send feature: false, the response retrieve all the information related with the project searched
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 16|
      | visibility  | public |
      | featured | false |
    When users want to get information on the project with the values
      | key   | value  |
      | featured | false |
    Then the api should response with code 200
  @find
  Scenario: Check when i send feature: true, the response retrieve all the information related with the project searched and check with json schema
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 17|
      | visibility  | public |
      | featured | true |
    When users want to get information on the project with the values
      | key   | value  |
      | featured | true |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send feature: false, the response retrieve all the information related with the project searched and check with json schema
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 18|
      | visibility  | public |
      | featured | false |
    When users want to get information on the project with the values
      | key   | value  |
      | featured | false |
    Then the api should response with code 200
    #And Check JSON schema jsonSchema/schema.json
  @find
  Scenario: Check when i send an specific feature with wrong credentials the response retrieve error message and code error and check with json schema
    Given A user with user "robertmm@icox.com" and password "434f651ed6a208d9cdedd7ab8d057d4214122cd64045a9d08d8768402f16749a"
    Given a project that already exists whit values
      | key  | value |
      | name | My Public Project 19|
      | visibility  | public |
      | featured | false |
    When users want to get information on the project with the values
      | key   | value  |
      | featured | false |
    Then the api should response with code 401
    #And Check JSON schema jsonSchema/schema.json