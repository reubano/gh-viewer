Controller = require 'controllers/base/controller'
Followers = require 'models/followers'
FollowersView = require 'views/followers-view'

module.exports = class NetworkController extends Controller
  initialize: =>
    @adjustTitle 'Followers Map'

  followers: (params) =>
    console.log 'network controller'
    @collection = new Followers params.login
    console.log @collection
    @view = new FollowersView {@collection}
    @collection.fetch()
