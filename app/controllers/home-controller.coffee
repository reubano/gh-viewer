Controller = require 'controllers/base/controller'
Model = require 'models/user'
View = require 'views/home-view'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class HomeController extends Controller
  initialize: =>
    @adjustTitle 'Home'
    utils.log 'initialize home-controller'

  show: (params) =>
    utils.log 'home controller'
    @model = new Model {@login}
    @view = new View {@model}
    @model.fetch()
