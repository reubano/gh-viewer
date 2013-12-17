Controller = require 'controllers/base/controller'
# Activity = require 'models/activity'
# Contrib = require 'models/contrib'
Gists = require 'models/gists'
# Repos = require 'models/repos'
# ActivityView = require 'views/activity-view'
# ContribView = require 'views/contrib-view'
GistsView = require 'views/gists-view'
# ReposView = require 'views/repos-view'

module.exports = class CodeController extends Controller
#   activity: (params) =>
#     console.log 'code activity controller'
#     comparator = (model) -> model.get 'created_at'
#     @collection = new Activity params.login
#     @collection.comparator = comparator
#     console.log @collection
#     @view = new ActivityView {@collection}
#     @collection.fetch()
#
#   contrib: (params) =>
#     console.log 'code contrib controller'
#     @collection = new Contrib params.login
#     console.log @collection
#     @view = new ContribView {@collection}
#     @collection.fetch()

  gists: (params) =>
    console.log 'code gists controller'
    @collection = new Gists params.login
    console.log @collection
    @view = new GistsView {@collection}
    @collection.fetch()

#   repos: (params) =>
#     console.log 'code repos controller'
#     @collection = new Repos login: 'reubano'
#     console.log @collection
#     @view = new ReposView {@collection}
#     @collection.fetch()
