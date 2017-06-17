Collection = require 'models/base/collection'
Model = require 'models/user'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Followers extends Collection
  model: Model
  type: 'followers'

  initialize: (options) =>
    super
    @url = "#{config.api_base}/#{@user}/followers?#{@query}"
