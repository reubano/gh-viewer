config = require 'config'

module.exports = class Navbar extends Chaplin.Model
  defaults: ->
    console.log 'setting Navbar defaults'
    items: [
    ]

    main: {href: '/', title: 'GitView'}

  initialize: (login) ->
    super
    console.log 'initializing navbar model'
