CollectionView = require 'views/base/collection-view'
template = require 'views/templates/gists'
View = require 'views/gist-view'
Common = require 'lib/common'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class GistsView extends CollectionView
  itemView: View
  autoRender: true
  listSelector: '#gist-list'
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) ->
    super
    utils.log 'initializing gists view'
    mediator.setActive mediator.title

  render: =>
    super
    utils.log 'rendering gists view'

    @listenTo @collection, 'sync', ->
      data = Common.convertData @collection
      utils.log data
      nv.addGraph utils.makeChart data, "#svg"
