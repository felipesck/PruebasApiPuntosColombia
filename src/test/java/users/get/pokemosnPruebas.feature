Feature: Get user on reqres

  Scenario: Get a user
    Given url "https://pokeapi.co/api/v2/pokemon/squirtle"
    When method get
    Then status 200


  Scenario: Guardar URL de la cadena de evolución de Charmander y hacer match con sus evoluciones

    # Paso 1: Obtener la URL de la especie
    Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
    When method GET
    Then status 200
    * def speciesUrl = response.species.url

    # Paso 2: Usar la URL de la especie para obtener la URL de la cadena de evolución
    Given url speciesUrl
    When method GET
    Then status 200
    * def evolutionChainUrl = response.evolution_chain.url

    # Paso 3: Usar la URL de la cadena de evolución para obtener las evoluciones
    Given url evolutionChainUrl
    When method GET
    Then status 200
    * def evolutions = response.chain.evolves_to

    # Paso 4: Hacer match de las evoluciones
    And match evolutions[0].species.name == 'charmeleon'
    And match evolutions[0].evolves_to[0].species.name == 'charizard'

