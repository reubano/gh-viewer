config = require 'config'

# User model. Main application model. Stores user data.
# Inherits from Chaplin model which inherits from Backbone model.
module.exports = class User extends Chaplin.Model
  # Corresponds to stuff like https://api.github.com/users/paulmillr.
  # Used when model fetch and save are done.
  url: => "https://api.github.com/users/#{@get 'login'}?access_token=#{config.api_token}"

  initialize: (options) =>
    super
    login = @get('login') ? options
    console.log "initializing #{login} user model"
