Controller = require 'controllers/base/controller'
Navbar = require 'models/navbar'
View = require 'views/home-view'

module.exports = class HomeController extends Controller
  index: ->
    @model = new Navbar
    @view = new View {@model}
