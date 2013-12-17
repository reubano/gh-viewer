CollectionView = require 'views/base/collection-view'
template = require 'views/templates/followers'
View = require 'views/person-view'
mediator = require 'mediator'

module.exports = class FollowersView extends CollectionView
  itemView: View
  autoRender: true
  listSelector: '#follower-list'
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    console.log 'initializing followers view'
    mediator.setActive mediator.title

  render: (options) =>
    super
    console.log 'rendering followers view'
    @on 'addedToDOM', ->
      console.log 'heard addedToDOM'
      mediator.map = L.map 'map'
      mediator.markers = L.markerClusterGroup()

    @listenTo @collection, 'sync', ->
      console.log "heard collection sync"
#       mediator.map.addLayer markers
