module.exports = (match) ->
  console.log 'start router'
  match '', 'home#show'
  match 'home', 'home#show'
  match 'user/:login', 'home#show'
  match 'user/:login/gists', 'code#gists'
  match 'user/:login/followers', 'network#followers'
