View = require 'views/base/view'
template = require 'views/templates/home'
mediator = require 'mediator'
config = require 'config'

module.exports = class HomeView extends View
  autoRender: false
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'change', =>
      console.log "heard model change"
      @render()

    console.log 'initializing home view'
    mediator.setActive mediator.title

  render: =>
    super
    console.log 'rendering home view'
    @on 'addedToDOM', ->
      @$("[data-toggle='tooltip']").tooltip()
      console.log 'heard addedToDOM'
      @location = @model.get('location')
      @login = @model.get('login')
      options = {providerName: 'openstreetmap'}
      if @location then @codeLocation L.map('map'), @location, @login, options
#       else @model.set 'location', 'N/A'

