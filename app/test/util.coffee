app = require '../app'

BASE_URL = "http://localhost:#{app.get 'port'}"

module.exports.urlFor = urlFor = (path) ->
  BASE_URL + '/' + path
