CollectionView = require 'views/base/collection-view'
template = require 'views/templates/activity'
View = require 'views/base/view'
Common = require 'lib/common'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class ActivityView extends CollectionView
  itemView: View
  autoRender: true
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    utils.log 'initializing activity view'
    mediator.setActive 'Activity'

  render: =>
    super
    utils.log "rendering activity view"
    @listenTo @collection, 'sync', ->
      data = Common.convertData @collection
      # utils.log data
      nv.addGraph utils.makeChart data, "#svg"
