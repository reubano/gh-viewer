View = require 'views/base/view'
template = require 'views/templates/person'
mediator = require 'mediator'
config = require 'config'

module.exports = class PersonView extends View
  autoRender: false
  tagName: 'li'
  className: 'col-sm-12 col-md-6 gallery'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'change', =>
      console.log "heard model change"
      @render()

    @id = @model.get('id')
    @location = @model.get('location')
    @login = @model.get('login')
    if @id then console.log "initializing person view for id #{@id}"
    else if @login then console.log "initializing person view for #{@login}"
    else return

    if not @location
      console.log "#{@login} has no location"
      @model.fetch()

  render: =>
    super
    @location = @model.get('location') ? false
    @login = @model.get 'login'
    @$("[data-toggle='tooltip']").tooltip()
    return if not (mediator.map and @location)
    console.log "rendering #{@login} person view"
    console.log @model
    options =
      icon: 'user'
      markerColor: 'blue'
      markers: mediator.markers
      center: [24.4, 29.9]
      zoomLevel: 1

    @codeLocation mediator.map, @location, @login, options
