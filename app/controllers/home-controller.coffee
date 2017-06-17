Controller = require 'controllers/base/controller'
User = require 'models/user'
View = require 'views/home-view'

module.exports = class HomeController extends Controller
  index: ->
    # Initialize new User with login from URL params.
    @model = new User login: 'reubano'
    @view = new View {@model}
    @model.fetch()

  show: (params) ->
    # Initialize new User with login from URL params.
    @model = new User login: params.login
    @view = new View {@model}
    @model.fetch()
