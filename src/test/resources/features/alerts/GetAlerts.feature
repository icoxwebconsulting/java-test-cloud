Feature: As a user of riskIQ platform I want to see a project or projects using search criteria

  @Alerts
  Scenario: Check the response of find all alerts when that exist in riskIQ platform,
  with wrong credentials the response retrieve error message and code error and check with Json schema
    Given a invalid user and invalid key from riskIQ platform
    When users want to get information of alerts without params
    Then the api should response with code 401
    And Check JSON schema "project/ErrorMessage.json"

#reporting in jira
  @Alerts
  Scenario: Check the response of find all alerts when that exist in riskIQ platform is a 200
    Given a valid user and key from riskIQ platform
    When users want to get information of alerts without params
    Then the api should response with code 200


  @Alerts
  Scenario: Check the response of find all projects when that exist in riskIQ platform is a 200
    Given a valid user and key from riskIQ platform
    When users want to get information of alerts without params
    Then the api should response with code 200
    # And Check JSON schema "project/GetAlert.json"

  @Alerts1
  Scenario: Check when i send project, the response retrieve all the information related with the project searched
    Given a created project with values
      | key        | value        |
      | name       | @@namerandom |
      | visibility | public       |
    And a valid user and key from riskIQ platform
    And a created artifact with values
      | key     | value       |
      | project | ##guid      |
      | query   | example.org |
    When users want to get information of alerts with the values
      | key     | value  |
      | project | ##guid |
    Then the api should response with code 200
    #And Response includes the following
     # | project | ##guid      |
     # | query   | example.org |

  @Alerts
  Scenario: Check when i send project, the response retrieve all the information related with the project searched and check with json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the project with the values
      | key     | value  |
      | project | @@guid |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send wrong value project, tthe response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the project with the values
      | key     | value   |
      | project | @@wrong |
    Then the api should response with code 404
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send invalid format project, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the project with the values
      | key     | value               |
      | project | @@InvalidFormatGuid |
    Then the api should response with code 400
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send an artifact, the response retrieve all the information related with the artifact searched
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key      | value      |
      | artifact | @@artifact |
    Then the api should response with code 200
    And Response includes the following
      | artifact | @@guid       |
      | query    | @@ValueQuery |

  @Alerts
  Scenario: Check when i send artifact, the response retrieve all the information related with the artifact searched and check with json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key      | value      |
      | artifact | @@artifact |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send wrong value artifact, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key      | value           |
      | artifact | @@wrongartifact |
    Then the api should response with code 404
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send invalid format artifact, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key      | value                   |
      | artifact | @@InvalidFormatArtifact |
    Then the api should response with code 400
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send an start date, the response retrieve all the information related with the artifact searched
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key   | value      |
      | start | @@starDate |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |

  @Alerts
  Scenario: Check when i send an start date, the response retrieve all the information related with the artifact searched and check with json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key   | value      |
      | start | @@starDate |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send wrong value start date, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key   | value           |
      | start | @@wrongstarDate |
    Then the api should response with code 404
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send invalid format start date, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key   | value                   |
      | start | @@InvalidFormatStarDate |
    Then the api should response with code 400
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send an end date, the response retrieve all the information related with the artifact searched
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key | value     |
      | end | @@endDate |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |

  @Alerts
  Scenario: Check when i send an end date, the response retrieve all the information related with the artifact searched and check with json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key | value     |
      | end | @@endDate |
    Then the api should response with code 200
    And Response includes the following
      | project | @@guid       |
      | query   | @@ValueQuery |
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send wrong value end date, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key | value          |
      | end | @@wrongendDate |
    Then the api should response with code 404
    And Check JSON schema "project/GetAlert.json"

  @Alerts
  Scenario: Check when i send invalid format end date, the response retrieve error message and code error and check with Json schema
    Given a valid user and key from riskIQ platform
    And a created artifact with values
      | key       | value             |
      | artifacts | @@ValuesArtifacts |
      | project   | @@guid            |
      | query     | @@ValueQuery      |
    When users want to get information of the artifact with the values
      | key | value                  |
      | end | @@InvalidFormatEndDate |
    Then the api should response with code 400
    And Check JSON schema "project/GetAlert.json"






