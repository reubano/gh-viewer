Model = require './model'
utils = require 'lib/utils'
mediator = require 'mediator'
config = require 'config'
devconfig = require 'devconfig'

module.exports = class Collection extends Chaplin.Collection
  # Mixin a synchronization state machine.
  _.extend @prototype, Chaplin.SyncMachine
  model: Model
  file: devconfig.storage.file
  local: devconfig.storage.local
  remote: devconfig.storage.remote
  query: "access_token=#{config.api_token}"

  initialize: (options) ->
    super
    @user = options.login
    utils.log "initialize #{@type} collection for #{@user}", 'info'
    @synced @afterSynced

  afterSynced: =>
    mediator.setSynced @
    utils.log "#{@type} collection:"
    utils.log @

  display: =>
    utils.log @, false
    # utils.log @at(1).getAttributes(), false

  reset: (models, options) =>
    super(models, options)

  fetch: (options) =>
    utils.log "fetching #{@type} collection"
    @beginSync()

    options = if options then _.clone(options) else {}
    success = options.success
    options.parse = options?.parse ? true
    options.success = (resp) => @processResp resp, options, success
    @wrapError options

    if @file
      utils.log "loading #{@type} collection from file"
      @filesync @, options
    else if @local or @remote
      utils.log "loading #{@type} collection from localStorage" if @local
      utils.log "loading #{@type} collection from server" if @remote
      @sync 'read', @, options
    else
      utils.log "One of the following must be set: 'file', 'local', 'remote'"

  parse: (resp) =>
    utils.log "parsing #{@type} resp"
    resp

  processResp: (resp, options, success) =>
    # return if @disposed
    options = options or {}
    utils.log "#{@type} success"
    method = if options.reset then 'reset' else 'set'
    @[method] resp, options
    success @, resp, options if success
    @finishSync()

  wrapError: (options) =>
    error = options.error
    options.error = (resp) =>
      error @, resp, options if error
      @unsync()

  urlError: ->
    throw new Error 'A "url" property or function must be specified'

  filesync: (collection, options) ->
    requireData = (options) -> require options.url

    $.Deferred((deferred) ->
      if not options.url
        url = _.result(collection, 'url') or urlError()
        deferred.reject if not url

      resp = requireData _.extend {url}, options
      collection.trigger 'request', collection, resp, options
      options.success resp
      deferred.resolve resp
    ).promise()
