$ ->

  class AccountView extends Backbone.View
    template: _.template $('#account_template').html()

    initialize: ->
      console.log "firing AccountView 'initialize'"

    render: ->
      console.log "firing AccountView 'render'"
      $(@el).html @template
      @


  class AilmentView extends Backbone.View
    template: _.template $('#ailment_template')

    initialize: ->
      console.log "firing AilmentView 'initialize'"

    render: ->
      console.log "firing AilmentView 'render'"
      $(@el).html @template
      @

  class MealsView extends Backbone.View
    template: _.template $('#meals_template')

    initialize: ->
      console.log "firing MealsView 'initialize'"

    render: ->
      console.log "firing MealsView 'render'"
      $(@el).html @template
      @


  class HistoryView extends Backbone.View
    template: _.template $('#history_template')

    initialize: ->
      console.log "firing HistoryView 'initialize'"

    render: ->
      console.log "firing HistoryView 'render'"
      $(@el).html @template
      @


  class NutriciousApp extends Backbone.Router
      
      routes:
        ''        : 'account'
        'ailment' : 'ailment'
        'meals'   : 'meals'
        'history' : 'history'

      initialize: =>
        console.log "firing router 'initialize'"
        @container = $('#page_content')

      account: ->
        console.log "firing router 'account'"
        @accountView = new AccountView()
        @container.html @accountView.render().el

      ailment: ->
        console.log "firing router 'ailment'"
        @ailmentView = new AilmentView()
        @container.html @ailmentView.render().el

      meals: ->
        console.log "firing router 'meals'"
        @mealsView = new MealsView()
        @container.html @mealsView.render().el

      history: ->
        console.log "firing router 'history'"
        @historyView = new HistoryView()
        @container.html @historyView.render().el



    window.App = new NutriciousApp()
    Backbone.history.start()
