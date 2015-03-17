View = require 'views/base/view'
template = require 'views/templates/person'
mediator = require 'mediator'
config = require 'config'
utils = require 'lib/utils'

module.exports = class PersonView extends View
  autoRender: true
  tagName: 'li'
  className: 'col-sm-12 col-md-6 gallery'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'change:location', @render
    @id = @model.get('id')
    @location = @model.get('location')
    @login = @model.get('login')
    return if not (@id or @login)

    if not @location
      utils.log "#{@login} has no location"
      @model.fetch()

  render: =>
    super
    @location = @model.get('location') ? false
    @login = @model.get 'login'
    @$("[data-toggle='tooltip']").tooltip()
    return if not (mediator.map and @location)
    utils.log "rendering #{@login} person view"

    options =
      icon: 'user'
      markerColor: 'blue'
      markers: mediator.markers
      center: [24.4, 29.9]
      zoomLevel: 1

    @codeLocation mediator.map, @location, @login, options
