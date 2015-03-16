module.exports = (match) ->
  match '', 'home#show'
  match 'home', 'home#show'
  match 'user/:login', 'home#show'
  match 'user/:login/gists', 'code#gists'
  # match 'user/:login/activity', 'code#activity'
  match 'user/:login/followers', 'network#followers'
