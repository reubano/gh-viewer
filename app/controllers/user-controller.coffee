Controller = require 'controllers/base/controller'
User = require 'models/user'
View = require 'views/user-view'

module.exports = class UserController extends Controller

  show: (params) ->
    console.log 'user controller'
    # Initialize new User with login from URL params.
    @model = new User login: params.login
    @view = new View {@model}
    @model.fetch().then @view.render
