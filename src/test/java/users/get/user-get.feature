Feature: Get user on reqres

  Scenario: Get a user
    Given url "https://pokeapi.co/api/v2/pokemon/squirtle"
    When method get
    Then status 200


  Scenario Outline: Obtener evoluciones de <namePokemon>
    Given url "https://pokeapi.co/api/v2/pokemon/<namePokemon>"
    When method GET
    And status 200
    And def urlSpec = $
    Then status 200
    And match response.evolves_from_species.name == <PokemonEvolution_2>
    And match response.evolves_to_species.name == <PokemonEvolution_3>

    Examples:
      | namePokemon | PokemonEvolution_2 | PokemonEvolution_3 |
      | charmander  | charmeleon         | charizard          |


  Scenario: Guardar URL de la especie de Charmander en una variable
    Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
    When method GET
    Then status 200
    * def speciesUrl = response.species.url
    And match speciesUrl == 'https://pokeapi.co/api/v2/pokemon-species/4/'


  Scenario: Guardar URL de la cadena de evolución de Charmander en una variable
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

    # Verificar que la URL de la cadena de evolución es la esperada
    And match evolutionChainUrl == 'https://pokeapi.co/api/v2/evolution-chain/2/'
