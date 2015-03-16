Model = require 'models/base/model'
utils = require 'lib/utils'

module.exports = class Gist extends Model
  initialize: (options) ->
    super
    utils.log "initialize gist model"
    if @has 'id'
      files = @get 'files'
      func = (t, s) -> t + s
      sum = _.pluck(files, 'size').reduce func, 0
      @set size_files: Math.round(sum / 102.4) / 10
      @set num_files: (k for k of files).length

