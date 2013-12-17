SiteView = require 'views/site-view'
Navbar = require 'models/navbar'
NavbarView = require 'views/navbar-view'
mediator = require 'mediator'
config = require 'config'

module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: (params, route) =>
    console.log "controller beforeAction"
    login = params?.login ? config.login
    @compose 'site', SiteView
    @compose 'navbar', ->
      @model = new Navbar login
      mediator.title = @model.get('main').title
      @view = new NavbarView {@model}


