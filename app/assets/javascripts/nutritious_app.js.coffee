$ ->

  class AccountView extends Backbone.View
    template: _.template $('#account_template').html()

    initialize: ->
      console.log "firing AccountView 'initialize'"

    render: ->
      console.log "firing AccountView 'render'"
      $(@el).html @template
      @


  class HomeView extends Backbone.View
    template: _.template $('#home_template').html()

    initialize: ->
      console.log "firing HomeView 'initialize'"

    render: ->
      console.log "firing HomeView 'render'"
      $(@el).html @template
      @


  class NutriciousApp extends Backbone.Router
      
      routes:
        '': 'home'
        'account': 'account'

      initialize: =>
        console.log "firing router 'initialize'"

      home: ->
        console.log "firing router 'home'"
        @homeView = new HomeView()
        $('#container').html @homeView.render().el

      account: ->
        console.log "firing router 'account'"
        @accountView = new AccountView()
        $('#container').html @accountView.render().el

    window.App = new NutriciousApp()
    Backbone.history.start()
