Model = require 'models/base/model'
config = require 'config'
utils = require 'lib/utils'

module.exports = class Navbar extends Model
  defaults: ->
    utils.log 'setting Navbar defaults'
    items: [
      {
        href: "/user/#{config.login}/activity"
        title: 'Activity'
        desc: 'View event activity'
      }
    ]

    main: {href: '/', title: 'GitView'}

  initialize: (login) ->
    super
    utils.log 'initializing navbar model'
