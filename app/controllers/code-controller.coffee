Controller = require 'controllers/base/controller'
# Activity = require 'models/activity'
Gists = require 'models/gists'
# Repos = require 'models/repos'
# ActivityView = require 'views/activity-view'
GistsView = require 'views/gists-view'
# ReposView = require 'views/repos-view'
utils = require 'lib/utils'

module.exports = class CodeController extends Controller
  # activity: (params) =>
  #   @adjustTitle 'Activity Graph'
  #   utils.log 'code activity controller'
  #   @collection = new Activity params.login
  #   @collection.comparator = (model) -> model.get 'created_at'
  #   @view = new ActivityView {@collection}
  #   @collection.fetch()

  # gists: (params) =>
  #   @adjustTitle 'Gists Graph'
  #   utils.log 'code gists controller'
  #   @collection = new Gists {@login}
  #   @collection.comparator = (model) -> - model.get 'created_at'
  #   @view = new GistsView {@collection}
  #   @collection.fetch()

  # repos: (params) =>
  #   @adjustTitle 'Repos Graph'
  #   utils.log 'code repos controller'
  #   @collection = new Repos login: 'reubano'
  #   utils.log @collection
  #   @view = new ReposView {@collection}
  #   @collection.fetch()
