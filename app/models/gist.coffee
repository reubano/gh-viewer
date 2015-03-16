module.exports = class Gist extends Chaplin.Model
  initialize: (options) ->
    super
    console.log "initialize gist model"
    if @has 'id'
      files = @get 'files'
      sum = _.pluck(files, 'size').reduce (t, s) -> t + s
      @set size_files: Math.round(sum / 102.4) / 10
      @set num_files: (k for k of files).length
