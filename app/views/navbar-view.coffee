View = require 'views/base/view'
template = require 'views/templates/navbar'
mediator = require 'mediator'

module.exports = class NavbarView extends View
  autoRender: true
  className: 'container'
  region: 'navbar'
  template: template
  listen: 'activeNav mediator': 'render'

  initialize: (options) =>
    super
    console.log 'initializing navbar view'

  render: =>
    super
    console.log 'rendering navbar view'
