CollectionView = require 'views/base/collection-view'
template = require 'views/templates/gists'
View = require 'views/gist-view'
mediator = require 'mediator'

module.exports = class GistsView extends CollectionView
  itemView: View
  autoRender: true
  listSelector: '#gist-list'
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) ->
    super
    console.log 'initializing gists view'
    mediator.setActive mediator.title

  render: =>
    super
    console.log 'rendering gists view'
