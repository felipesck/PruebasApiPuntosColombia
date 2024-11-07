Feature: Reausable scenarios for post a user

  @Create
  Scenario:
    Given url "https://reqres.in/api/users/"
    And request { "name": "felipe", "job": "doctor" }
    When method post
    Then status 201
    And def contactId = $.id