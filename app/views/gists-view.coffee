CollectionView = require 'views/base/collection-view'
template = require 'views/templates/gists'
View = require 'views/base/view'
Common = require 'lib/common'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class GistsView extends CollectionView
  itemView: View
  autoRender: true
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) ->
    super
    utils.log 'initializing gists view'
    @user = options.user
    mediator.setActive mediator.title

  render: =>
    super

    @listenTo @collection, 'sync', ->
      data = Common.convertData @collection
      utils.log data
      nv.addGraph utils.makeChart data, "#svg"

  getTemplateData: =>
    utils.log 'get followers view template data'
    templateData = super
    templateData.user = @user
    templateData
