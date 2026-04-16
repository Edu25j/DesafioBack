@featureRegistrarUsuario
Feature: Registrar usuario en serverest

  Background: Configuracion inicial
    * url baseUrl
    * def requests = read ('classpath:requests/registerUser.json')
    * def schema = read ('classpath:schemas/request.json')
    * def schemaerrores = read ('classpath:schemas/errors.json')
    * def ts = new Date().getTime() + ''
    * def emailParam = 'test' + ts + '@test.com'

  @test1
  Scenario: Registrar un usuario en la tienda virtual
    * def emailFinal = emailParam
    * def body = requests.casos.crear
    * set body.email = emailFinal
    Given path '/usuarios'
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 201
    Then match response == schema.crear
    * def idasignada = response._id


  Scenario: Verificar mensaje de error cuando no se envia campo obligatorio
    * def body = requests.casos.crear
    * set body.email = ''
    Given path '/usuarios'
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 400
    Then match response == schemaerrores['registrar_400']
