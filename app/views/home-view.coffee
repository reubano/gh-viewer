View = require 'views/base/view'
template = require 'views/templates/home'
Navbar = require 'models/navbar'
mediator = require 'mediator'

window.onLoadGoogleApiCallback = ->
  L.GeoSearch.Provider.Google.Geocoder = new google.maps.Geocoder()
  document.body.removeChild(document.getElementById('load_google_api'))
  mediator.publish 'googleLoaded'

module.exports = class HomeView extends View
  autoRender: false
  className: 'row'
  region: 'content'
  template: template

  listen: 'change model': ->
    console.log 'heard model change'
    @render()

  initialize: (options) =>
    super
    console.log 'init home view'
    mediator.setActive (new Navbar).get('main').title

  render: =>
    super
    console.log 'rendering home-view'
    @on 'addedToDOM', ->
      console.log 'heard addedToDOM'
      @codeAddress @model.get 'location'

  codeAddress: (address) =>
    console.log 'coding address: ' + address
    map = L.map('map')
    marker = L.AwesomeMarkers.icon {icon: 'home', markerColor: 'green'}
    searchProvider = new L.GeoSearch.Provider.Google()
    searchOptions = {provider: searchProvider, zoomLevel: 4}
    L.tileLayer.provider('MapBox.reubano.ghdp3e73').addTo(map)
    L.Control.GeoSearch = L.Control.GeoSearch.extend
      _showLocation: (location) ->
        L.marker([location.Y, location.X], {icon: marker}).addTo(map)
        map.setView [location.Y, location.X], @_config.zoomLevel, false
        map.fireEvent 'geosearch_showlocation', {Location: location}

    search = new L.Control.GeoSearch searchOptions
    search.addTo map
    @subscribeEvent 'googleLoaded', -> search.geosearch address
