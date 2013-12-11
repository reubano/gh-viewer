View = require 'views/base/view'
template = require 'views/templates/home'
mediator = require 'mediator'

module.exports = class HomeView extends View
  autoRender: true
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    console.log 'init home view'
    mediator.setActive @model.get('main').title

