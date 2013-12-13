module.exports = (match) ->
  console.log 'start router'
  match '', 'home#index'
  match '/:login', 'home#show'
  match '/followers', 'followers#show'
  match '/following', 'following#show'
  match '/repos', 'repos#show'
