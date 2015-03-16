mediator = require 'mediator'

# The application object.
module.exports = class Application extends Chaplin.Application
  title: 'Top Githubbers'

  # start: ->
  #   # You can fetch some data here and start app
  #   # (by calling `super`) after that.
  #   super

  # Create additional mediator properties.
  initMediator: ->
    # Add additional application-specific properties and methods
    console.log 'initializing mediator'
    mediator.active = null
    mediator.user = null
    mediator.googleLoaded = null
    mediator.map = null
    mediator.markers = null
    mediator.doneSearching = null
    mediator.title = null
    # Seal the mediator
    super
