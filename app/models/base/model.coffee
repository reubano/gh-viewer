utils = require 'lib/utils'

module.exports = class Model extends Chaplin.Model
  # _.extend @prototype, Chaplin.SyncMachine

  display: =>
    utils.log @, false
    utils.log @getAttributes(), false
