Collection = require 'models/base/collection'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Activity extends Collection
  type: 'activity'

  initialize: (options) =>
    super
    @url = "#{config.api_base}/#{@user}/followers?#{@query}"
