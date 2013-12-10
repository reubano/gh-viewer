mediator = require 'mediator'

# The application object.
module.exports = class Application extends Chaplin.Application
  # start: ->
  #   # You can fetch some data here and start app
  #   # (by calling `super`) after that.
  #   super

  # Create additional mediator properties.
  initMediator: ->
    # Add additional application-specific properties and methods
    console.log 'init app'
    mediator.active = null
    # Seal the mediator
    super
