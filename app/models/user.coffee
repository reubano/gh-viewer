Model = require 'models/base/model'
config = require 'config'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class User extends Model
  initialize: (options) =>
    super
    @login = @get('login') ? options?.login
    # utils.log "initializing #{@login} user model"
    @url = "#{config.api_base}/#{@login}?#{@query}"

    L.Control.GeoSearch =
      L.Control.GeoSearch.extend
        _showLocation: (coordinates) => @set {coordinates}

    @srchProviderName = config.options.srchProviderName
    srchProvider = config.srchProviders[@srchProviderName]

    @search = new L.Control.GeoSearch
      provider: new L.GeoSearch.Provider[srchProvider]()

  failWhale: (res, textStatus, err) =>
    utils.log "failed to fetch #{@login}'s data"
    utils.log "error: #{err} with #{@login}", 'error' if err

  getCoords: =>
    @search.addTo mediator.map
    location = @get 'location'
    google = @srchProviderName.indexOf('google') is 0
    utils.log "coding location: #{location} with #{@srchProviderName}"

    if google and mediator.googleLoaded
      @search.geosearch location
    else if google
      do (model = @) =>
        @subscribeEvent 'googleLoaded', ->
          model.search.geosearch model.get 'location'
    else
      @search.geosearch location

  _fetchCoords: (map) =>
    $.Deferred((deferred) =>
      if @has('location') and mediator.map
        @getCoords()
        deferred.resolve
      else if @has 'location'
        @subscribeEvent 'mapSet', =>
          @getCoords()
          deferred.resolve
          mediator.unsubscribe 'mapSet'
      else
        deferred.reject
        utils.log 'No location!'
    ).promise()

  fetchData: =>
    utils.log "fetching #{@login}'s data"

    if @has('location')
      utils.log "fetching #{@login}'s coordinates"
      @_fetchCoords()
    else
      utils.log "fetching #{@login}'s location"

      @fetch
        success: (model) ->
          model._fetchCoords()
          # model.display()
        error: @failWhale
