Model = require 'models/base/model'
utils = require 'lib/utils'

module.exports = class Navbar extends Model
  defaults:
    items: [
      {href: '/activity', title: 'Activity', desc: 'View commit activity'},
      {href: '/contribution', title: 'Contribution', desc: 'View contribution'},
      {href: '/repos', title: 'Repos', desc: 'View public repos'},
    ]

    main: {href: '/', title: 'GitView'}

  initialize: ->
    super
