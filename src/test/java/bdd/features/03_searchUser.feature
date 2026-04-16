@featureBuscarUsuario
Feature: Buscar usuario en serverest

  Background: Configuracion inicial
    * url baseUrl
    * def requests = read ('classpath:requests/registerUser.json')
    * def result = call read('classpath:bdd/features/01_registerUser.feature@test1')
    * def schema = read ('classpath:schemas/request.json')
    * def schemaerrores = read ('classpath:schemas/errors.json')
    * def idasignada = result.idasignada

  Scenario: Buscar un usuario registrado en la tienda virtual
    Given path '/usuarios/' + idasignada
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    Then match response == schema.buscar

  Scenario: Verificar la busqueda de un codigo de usuario no registrado en la tienda virtual
    Given path '/usuarios/' + "UserDummy1234567"
    And header Content-Type = 'application/json'
    When method get
    Then status 400
    Then match response == schemaerrores['buscar_400']
