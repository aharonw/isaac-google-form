modules = [
  'index'
]

module.exports = (app) ->
  require('./controllers/' + module) app for module in modules
