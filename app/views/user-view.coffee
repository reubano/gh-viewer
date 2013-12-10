View = require '/views/base/view'
template = require 'views/templates/user'
mediator = require 'mediator'

module.exports = class UserView extends View
  autoRender: true
  className: 'row'
  region: 'content'
  template: template

  initialize: (options) =>
    super
    console.log 'init user view'
    mediator.setActive @model.get 'login'
