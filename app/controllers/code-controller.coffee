Controller = require 'controllers/base/controller'
Activity = require 'models/activity'
# Contrib = require 'models/contrib'
Gists = require 'models/gists'
# Repos = require 'models/repos'
ActivityView = require 'views/activity-view'
# ContribView = require 'views/contrib-view'
GistsView = require 'views/gists-view'
# ReposView = require 'views/repos-view'
utils = require 'lib/utils'

module.exports = class CodeController extends Controller
  activity: (params) =>
    @adjustTitle 'Activity Graph'
    utils.log 'code activity controller'
    comparator = (model) -> model.get 'created_at'
    @collection = new Activity params.login
    @collection.comparator = comparator
    utils.log @collection
    @view = new ActivityView {@collection}
    @collection.fetch()
#
#   contrib: (params) =>
#     @adjustTitle 'Contribution Graph'
#     utils.log 'code contrib controller'
#     @collection = new Contrib params.login
#     utils.log @collection
#     @view = new ContribView {@collection}
#     @collection.fetch()

  gists: (params) =>
    @adjustTitle 'Gists Graph'
    utils.log 'code gists controller'
    @collection = new Gists params.login
    utils.log @collection
    @view = new GistsView {@collection}
    @collection.fetch()

#   repos: (params) =>
#     @adjustTitle 'Repos Graph'
#     utils.log 'code repos controller'
#     @collection = new Repos login: 'reubano'
#     utils.log @collection
#     @view = new ReposView {@collection}
#     @collection.fetch()
