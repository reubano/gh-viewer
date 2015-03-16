Model = require 'models/gist'
config = require 'config'

module.exports = class Gists extends Chaplin.Collection
  model: Model

  initialize: (login) =>
    super
    console.log "initialize gists collection for #{login}"
    @url = "#{config.api_base}/#{login}/gists?access_token=#{config.api_token}"
