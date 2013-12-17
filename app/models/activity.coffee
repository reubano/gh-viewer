config = require 'config'

module.exports = class Activity extends Chaplin.Collection
  initialize: (login) =>
    super
    console.log "initialize activity collection for #{login}"
    @url = -> "https://api.github.com/users/#{login}/events?access_token=#{config.api_token}"
