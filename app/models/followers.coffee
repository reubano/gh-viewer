Model = require 'models/user'
config = require 'config'

module.exports = class Followers extends Chaplin.Collection
  model: Model

  initialize: (login) =>
    super
    console.log "initialize followers collection for #{login}"
    @url = -> "https://api.github.com/users/#{login}/followers?access_token=#{config.api_token}"
