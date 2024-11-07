Feature: Get user on reqres

  Scenario: Get a user
    Given url "https://pokeapi.co/api/v2/pokemon/squirtle"
    When method get
    Then status 200


  Scenario: Guardar URL de la especie de Charmander en una variable
    Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
    When method GET
    Then status 200
    * def speciesUrl = response.species.url
    And match speciesUrl == 'https://pokeapi.co/api/v2/pokemon-species/4/'


  Scenario: Guardar URL de la cadena de evolución de Charmander en una variable

    Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
    When method GET
    Then status 200
    * def speciesUrl = response.species.url


    Given url speciesUrl
    When method GET
    Then status 200
    * def evolutionChainUrl = response.evolution_chain.url

    And match evolutionChainUrl == 'https://pokeapi.co/api/v2/evolution-chain/2/'
