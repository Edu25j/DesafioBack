@featureActualizarUsuario
Feature: Actualizar usuario en serverest

  Background: Configuracion inicial
    * url baseUrl
    * def requests = read ('classpath:requests/registerUser.json')
    * def ts = new Date().getTime() + ''
    * def emailParam = 'act' + (ts+1) + '@test.com'
    * def result = call read('classpath:bdd/features/01_registerUser.feature@test1')
    * def schema = read ('classpath:schemas/request.json')
    * def schemaerrores = read ('classpath:schemas/errors.json')
    * def idasignada = result.idasignada

  Scenario: Actualizar un usuario registrado en la tienda virtual
    * def req = requests.casos.actualizar
    * set req.email = emailParam
    Given path '/usuarios/' + idasignada
    And header Content-Type = 'application/json'
    And request req
    When method put
    Then status 200
    Then match response == schema.actualizar

  Scenario: Verificar actualizacion cuando se envia un email ya registrado
    * def req = requests.casos.actualizar
    * set req.email = "act17762824680211@test.com"
    Given path '/usuarios/' + idasignada
    And header Content-Type = 'application/json'
    And request req
    When method put
    Then status 400
    Then match response == schemaerrores['actualizar_400']