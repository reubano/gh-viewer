Model = require 'models/base/model'
config = require 'config'

module.exports = class Navbar extends Model
  defaults: ->
    console.log 'setting Navbar defaults'
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
    console.log 'initializing navbar model'
