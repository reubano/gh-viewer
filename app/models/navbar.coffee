Model = require 'models/base/model'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Navbar extends Model
  defaults: ->
    utils.log 'setting Navbar defaults'
    items: []
    main: {href: '/', title: 'GitView'}

  initialize: ->
    super
    utils.log 'initializing navbar model'
