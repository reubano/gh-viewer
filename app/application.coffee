mediator = require 'mediator'
Navbar = require 'models/navbar'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Application extends Chaplin.Application
  title: 'GitView'

  initMediator: ->
    utils.log 'initializing mediator'
    mediator.navbar = new Navbar()
    mediator.tiles = null
    mediator.markers = []
    mediator.synced = {}
    mediator.active = null
    mediator.user = null
    mediator.googleLoaded = null
    mediator.map = null
    mediator.AwesomeMarker = L.AwesomeMarkers.icon config.options
    mediator.doneSearching = null
    mediator.title = null
    mediator.seal()
    super
