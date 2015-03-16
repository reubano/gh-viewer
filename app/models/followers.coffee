Collection = require 'models/base/collection'
Model = require 'models/user'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Followers extends Collection
  model: Model

  initialize: (login) =>
    super
    utils.log "initialize followers collection for #{login}"
    query = "access_token=#{config.api_token}"
    @url = "#{config.api_base}/#{login}/followers?#{query}"
