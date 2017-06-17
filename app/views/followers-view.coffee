CollectionView = require 'views/base/collection-view'
template = require 'views/templates/followers'
View = require 'views/person-view'
mediator = require 'mediator'
utils = require 'lib/utils'

module.exports = class FollowersView extends CollectionView
  itemView: View
  autoRender: true
  listSelector: '#follower-list'
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    utils.log 'initializing followers view'
    mediator.setActive 'home'

  render: (options) =>
    super
    utils.log 'rendering followers view'
    @on 'addedToDOM', @setMap
    # @listenTo @collection, 'sync', -> mediator.map.addLayer markers

  getTemplateData: =>
    utils.log 'get followers view template data'
    templateData = super
    templateData.user = @collection.user
    templateData
