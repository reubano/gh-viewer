Collection = require 'models/base/collection'
config = require 'config'

module.exports = class Activity extends Collection
  initialize: (login) =>
    super
    console.log "initialize activity collection for #{login}"
    query = "access_token=#{config.api_token}"
    @url = "#{config.api_base}/#{login}/followers?#{query}"
