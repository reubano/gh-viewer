Model = require 'models/base/model'
utils = require 'lib/utils'

module.exports = class Navbar extends Model
  defaults:
    items: [
      {href: '/user/reubano', title: 'reubano', desc: 'View reubano'},
      {href: '/user/paulmillr', title: 'paulmillr', desc: 'View paulmillr'},
    ]

    main: {href: '/', title: 'GitView'}

  initialize: ->
    super
