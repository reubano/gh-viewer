SiteView = require 'views/site-view'
Navbar = require 'models/navbar'
NavbarView = require 'views/navbar-view'
mediator = require 'mediator'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: (params, route) =>
    utils.log "controller beforeAction"
    login = params?.login ? config.login
    @reuse 'site', SiteView
    @reuse 'navbar', ->
      @model = new Navbar login
      mediator.title = @model.get('main').title
      @view = new NavbarView {@model}


