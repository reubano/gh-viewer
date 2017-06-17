config = require 'config'
mediator = require 'mediator'
utils = require 'lib/utils'
require 'lib/view-helper' # Just load the view helpers, no return value

module.exports = class View extends Chaplin.View
  # Auto-save `template` option passed to any view as `@template`.
  optionNames: Chaplin.View::optionNames.concat ['template']

  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template

  addMarkers: (map) ->
    if mediator.markers?.clearLayers?
      mediator.markers.clearLayers()

    map.addLayer mediator.markers

  setMap: =>
    console.log 'setMap'
    options = config.options
    tileProvider = config.tileProviders[options.tileProvider]
    L.Icon.Default.imagePath = '/images'
    mediator.tiles = L.tileLayer.provider tileProvider, options.tpOptions

    map = mediator.map = L.map 'map'
    map.addLayer mediator.tiles
    map.setView options.center, options.zoomLevel, false
    @addMarkers map
    mediator.publish 'mapSet'
    console.log mediator.map?

  addCoords: (coordinates, pan) =>
    map = mediator.map
    location = @model.get 'location'
    login = @model.get 'login'
    console.log "addCoords #{login}: #{location}"

    [x, y] = [coordinates.X, coordinates.Y]
    [AwesomeMarker, markers] = [mediator.AwesomeMarker, mediator.markers]
    marker = L.marker([y, x], {icon: AwesomeMarker}).addTo markers
    marker.bindPopup "#{login}: #{location}"
    marker.on 'mouseover', (e) -> e.target.openPopup()
    marker.on 'mouseout', (e) -> e.target.closePopup()

    if pan
      map.setView [y, x], map._zoom, animation: true

    map.fireEvent 'geosearch_showlocation', {Location: coordinates}

  addToMap: (options) =>
    @$("[data-toggle='tooltip']").tooltip()
    location = @model.get 'location'
    coordinates = @model.get 'coordinates'

    if mediator.map and coordinates
      @addCoords coordinates, options?.pan
    else if coordinates
      @subscribeEvent 'mapSet', =>
        @addCoords coordinates, options?.pan
        mediator.unsubscribe 'mapSet'
    else
      @model.fetchData()
