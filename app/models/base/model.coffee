utils = require 'lib/utils'
config = require 'config'

module.exports = class Model extends Chaplin.Model
  # _.extend @prototype, Chaplin.SyncMachine
  query: if config.api_token then "access_token=#{config.api_token}" else ''

  display: =>
    utils.log @, false
    utils.log @getAttributes(), false
