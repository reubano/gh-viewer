View = require 'views/base/view'
template = require 'views/templates/person'
mediator = require 'mediator'
config = require 'config'
utils = require 'lib/utils'

module.exports = class PersonView extends View
  autoRender: false
  tagName: 'li'
  className: 'col-sm-12 col-md-6 gallery'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'sync', @render
    @listenTo @model, 'change', @addToMap
    utils.log "initialize person-view: #{@model.get 'login'}"
    @model.fetchData()

  render: =>
    super
    utils.log "render person-view: #{@model.get 'login'}"
