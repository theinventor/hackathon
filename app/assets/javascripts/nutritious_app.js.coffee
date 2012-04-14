$ ->

  

  class NutriciousApp extends Backbone.Router
      
      routes:
        '': 'home'

      initialize: ->
        console.log "firing router 'initialize'"

      home: ->
        console.log "firing router 'home'"

      account: ->
        console.log "firing router 'account'"

    window.App = new NutriciousApp()
