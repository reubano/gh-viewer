NavbarView = require 'views/navbar-view'

class NavbarViewTest extends NavbarView
  renderTimes: 0

  render: ->
    super
    @renderTimes += 1

describe 'NavbarView', ->
  beforeEach ->
    @view = new NavbarViewTest

  afterEach ->
    @view.dispose()

  it 'should display 4 links', ->
    expect(@view.$el.find 'a').to.have.length 4
