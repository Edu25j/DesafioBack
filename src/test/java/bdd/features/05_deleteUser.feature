@featureEliminar
Feature: Eliminar usuario en serverest

  Background: Configuracion inicial
    * url baseUrl
    * def requests = read ('classpath:requests/registerUser.json')
    * def result = call read('classpath:bdd/features/01_registerUser.feature@test1')
    * def schema = read ('classpath:schemas/request.json')
    * def schemaerrores = read ('classpath:schemas/errors.json')
    * def idasignada = result.idasignada

  Scenario: Eliminar un usuario registrado en la tienda virtual
    Given path '/usuarios/' + idasignada
    And header Content-Type = 'application/json'
    When method delete
    Then status 200
    Then match response == schema.eliminar
    * match response.message == 'Registro excluído com sucesso'

  Scenario: Verificar la eliminacion de un usuario con productos en carrito de la tienda virtual
    Given path '/usuarios/' + "0uxuPY0cbmQhpEz1"
    And header Content-Type = 'application/json'
    When method delete
    Then status 400
    Then match response == schemaerrores['eliminar_400']
    * match response.message == 'Não é permitido excluir usuário com carrinho cadastrado'


