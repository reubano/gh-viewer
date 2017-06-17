View = require 'views/base/view'
template = require 'views/templates/gist'
utils = require 'lib/utils'

module.exports = class GistView extends View
  autoRender: false
  tagName: 'tr'
  template: template

  initialize: (options) =>
    super
    @listenTo @model, 'change', @render
    @id = @model.get('id')
    @login = @model.get('login')

  render: ->
    super
    utils.log "rendering gist view"
