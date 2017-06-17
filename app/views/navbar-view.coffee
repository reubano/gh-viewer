View = require 'views/base/view'
template = require 'views/templates/navbar'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class NavbarView extends View
  autoRender: true
  className: 'container'
  region: 'navbar'
  template: template
  listen: 'activeNav mediator': 'render'

  initialize: (options) =>
    super
    utils.log 'initializing navbar view'

  render: =>
    super
    utils.log 'rendering navbar view'
