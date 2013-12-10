SiteView = require 'views/site-view'
Navbar = require 'models/navbar'
NavbarView = require 'views/navbar-view'

module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: ->
    @compose 'site', SiteView
    @compose 'navbar', ->
      @model = new Navbar
      @view = new NavbarView {@model}


