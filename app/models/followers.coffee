Model = require 'models/user'
config = require 'config'

module.exports = class Followers extends Chaplin.Collection
  model: Model

  initialize: (login) =>
    super
    console.log "initialize followers collection for #{login}"
    query = "access_token=#{config.api_token}"
    @url = "#{config.api_base}/#{login}/followers?#{query}"
