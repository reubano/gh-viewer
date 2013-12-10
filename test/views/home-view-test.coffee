HomeView = require 'views/home-page-view'

describe 'HomeView', ->
  beforeEach ->
    @view = new HomeView

  afterEach ->
    @view.dispose()

  it 'should auto-render', ->
    expect(@view.$el.find 'img').to.have.length 1
