mediator = module.exports = Chaplin.mediator

mediator.setActive = (title) ->
  mediator.active = title
  console.log "set activeNav: #{mediator.active}"
  mediator.publish 'activeNav'

mediator.setSynced = (collection) ->
  console.log "#{collection.type} synced!!"
  mediator.synced[collection.type] = true
  mediator.publish "synced:#{collection.type}", collection
