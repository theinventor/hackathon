$ ->

  class BaseView extends Backbone.View
    loadingIcon: $('#loading_icon').html()

    bindModelToForm: ->
      console.log "firng BaseView 'bindModelToForm'"
      if @model != null
        for field in @modelBindings
          do (field) =>
            data = {}
            data[field] = @$(".#{field}").val()
            @model.set data


  class BaseModel extends Backbone.Model
    
    sendPost: (payload, callback) ->
      $.ajax
          url: payload.url,
          type: "POST",
          dataType: 'json',
          data: JSON.stringify(payload.params),
          contentType: 'application/json; charset=utf-8',
          success:  (data) -> 
            console.log data
            # if typeof callback is 'function'
            #   callback data

          error: (jqXHR, textStatus, errorThrown) ->
            console.log 'error'
            # if typeof callback is 'function'
            #   callback()

          complete: (xhr, status) ->
              # if status is 'error' or not xhr.responseText
                  # console.log xhr.responseText

  class AccountView extends Backbone.View
    template: _.template $('#account_template').html()

    initialize: ->
      console.log "firing AccountView 'initialize'"

    render: ->
      console.log "firing AccountView 'render'"
      $(@el).html @template
      @


  class Symptom extends BaseModel
    console.log "firing SymptomModel 'save'"
    
    save: (callback) ->
      payload = 
        url: '/symptoms'
        params: @.toJSON()

      @sendPost payload


  class SymptomView extends BaseView
    url: '/symptoms/new'
    template: _.template $('#symptom_template').html()

    events: 
      'blur input'                : 'bindModelToForm'
      'click input[name=commit]'  : 'save'

    modelBindings: ["title"]

    initialize: ->
      console.log "firing SymptomView 'initialize'"
      @model = new Symptom()

    render: ->
      console.log "firing SymptomView 'render'"
      $(@el).html @template
      @$('#page_content').html @loadingIcon
      @loadForm()
      @

    loadForm: ->
      $.get @url, (data) => @$('#page_content').html data

    save: (evt) ->
      evt.preventDefault()
      @model.save()


  class MealsView extends Backbone.View
    template: _.template $('#meals_template').html()

    initialize: ->
      console.log "firing MealsView 'initialize'"

    render: ->
      console.log "firing MealsView 'render'"
      $(@el).html @template
      @


  class HistoryView extends Backbone.View
    template: _.template $('#history_template').html()

    initialize: ->
      console.log "firing HistoryView 'initialize'"

    render: ->
      console.log "firing HistoryView 'render'"
      $(@el).html @template
      @


  class window.NutritiousApp extends Backbone.Router
      
      routes:
        ''        : 'account'
        'symptom' : 'symptom'
        'meals'   : 'meals'
        'history' : 'history'

      initialize: =>
        console.log "firing router 'initialize'"
        @container = $('#template_container')

      account: ->
        console.log "firing router 'account'"
        @accountView = new AccountView()
        @container.html @accountView.render().el

      symptom: ->
        console.log "firing router 'ailment'"
        @symptomView = new SymptomView()
        @container.html @symptomView.render().el

      meals: ->
        console.log "firing router 'meals'"
        @mealsView = new MealsView()
        @container.html @mealsView.render().el

      history: ->
        console.log "firing router 'history'"
        @historyView = new HistoryView()
        @container.html @historyView.render().el
