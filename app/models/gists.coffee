Collection = require 'models/base/collection'
Model = require 'models/gist'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Gists extends Collection
  model: Model

  initialize: (login) =>
    super
    utils.log "initialize gists collection for #{login}"
    @url = "#{config.api_base}/#{login}/gists?access_token=#{config.api_token}"
