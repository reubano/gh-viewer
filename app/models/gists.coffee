Collection = require 'models/base/collection'
Model = require 'models/gist'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Gists extends Collection
  model: Model
  type: 'gists'

  initialize: (options) =>
    super
    @url = "#{config.api_base}/#{@user}/gists?#{@query}"
