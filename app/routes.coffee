module.exports = (match) ->
  console.log 'start router'
  match '', 'home#index'
  match 'user/:login', 'user#show'
