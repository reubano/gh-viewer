config = require 'config'
mediator = require 'mediator'
require 'lib/view-helper' # Just load the view helpers, no return value

module.exports = class View extends Chaplin.View
  # Auto-save `template` option passed to any view as `@template`.
  optionNames: Chaplin.View::optionNames.concat ['template']

  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template

  codeLocation: (map, location, login, tmp=false) =>
    options = {}
    _.extend options, config.options
    _.extend options, tmp
    options.provider = new config.srchProviders[options.srchProviderName]()
    if not location? then return console.log "#{login} has no location"
    console.log "coding location: #{location} with #{options.srchProviderName}"
    markers = options.markers
    icon = L.AwesomeMarkers.icon options
    tileProvider = config.tileProviders[options.tileProvider]
    L.tileLayer.provider(tileProvider, options.tpOptions).addTo(map)
    map.setView(options.center, options.zoomLevel, false) if options.center

    L.Control.GeoSearch = L.Control.GeoSearch.extend
      _showLocation: (coordinates) ->
        [x, y] = [coordinates.Y, coordinates.X]
        marker = L.marker([x, y], {icon: icon}).addTo(map)
        marker.bindPopup "#{login}: #{location}"
        marker.on 'mouseover', (e) -> e.target.openPopup()
        marker.on 'mouseout', (e) -> e.target.closePopup()
        markers.addLayer(marker) if markers
        mediator.publish 'geosearchLocated', coordinates
        map.fireEvent 'geosearch_showlocation', {Location: coordinates}

    @subscribeEvent 'geosearchLocated', (coordinates) =>
      console.log 'heard geosearchLocated'
      [x, y] = [coordinates.Y, coordinates.X]
      map.setView([x, y], options.zoomLevel, false) if not options.center

    search = new L.Control.GeoSearch options
    search.addTo map
    google = options.srchProviderName.indexOf('google') is 0

    if google and mediator.googleLoaded
      search.geosearch location
    else if google
      @subscribeEvent 'googleLoaded', -> search.geosearch location
    else
      search.geosearch location

