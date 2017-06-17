View = require 'views/base/view'
template = require 'views/templates/home'
mediator = require 'mediator'
config = require 'config'
utils = require 'lib/utils'

module.exports = class HomeView extends View
  autoRender: false
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'sync', @render
    @listenTo @model, 'change', => @addToMap pan: true, zoom: 3
    @on 'addedToDOM', @setMap
    utils.log 'initializing home view'
    mediator.setActive mediator.title

  render: =>
    super
    utils.log 'rendering home view'
