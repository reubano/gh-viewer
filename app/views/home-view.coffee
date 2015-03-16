View = require 'views/base/view'
template = require 'views/templates/home'
mediator = require 'mediator'
config = require 'config'
utils = require 'lib/utils'

module.exports = class HomeView extends View
  autoRender: false
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'change', @render
    utils.log 'initializing home view'
    mediator.setActive mediator.title

  render: =>
    super
    utils.log 'rendering home view'
    @on 'addedToDOM', ->
      @$("[data-toggle='tooltip']").tooltip()
      @location = @model.get('location')
      @login = @model.get('login')
      options = {providerName: 'openstreetmap'}
      if @location then @codeLocation L.map('map'), @location, @login, options
#       else @model.set 'location', 'N/A'

