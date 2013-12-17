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
    console.log 'initializing activity view'
    mediator.setActive 'Activity'

  render: =>
    super
    console.log "rendering activity view"
    @listenTo @collection, 'sync', ->
      console.log "heard collection sync"
      data = Common.convertData @collection
#       console.log data
      nv.addGraph utils.makeChart data, "#horz-svg"
