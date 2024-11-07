Feature: Obtener cadena de evolución

  Scenario: Obtener cadena de evolución desde URL
    Given url url
    When method GET
    Then status 200
    And def chain = response.chain
    And return chain
