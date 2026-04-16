@featureListarUsuarios
Feature: Listar usuarios en serverest

  Background: Configuracion inicial
    * url baseUrl
    * def schema = read ('classpath:schemas/request.json')

  Scenario: Consulta del listado de usuarios registrados en la tienda virtual
    Given path '/usuarios'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    Then match response == schema.listar