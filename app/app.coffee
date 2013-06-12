PORT = process.env.PORT or 3000
PORT_TEST = PORT + 1

###
Module dependencies.
###
express = require('express')
http = require('http')
path = require('path')
app = express()
fashionista = require('fashionista')

fashionista().decorate(app)

app.configure ->
  app.set 'port', PORT
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  #app.use express.cookieParser('your secret here')
  #app.use express.session()
  app.use app.router
  app.use require('connect-assets')(src: path.join(__dirname, 'assets'))
  app.use express.static path.join(__dirname, 'public')
  require('./middleware/404')(app)

app.configure 'development', ->
  app.use express.errorHandler()

app.configure 'test', ->
  app.set 'port', PORT_TEST

require('./config/routes')(app)

http.createServer(app).listen app.get('port'), ->
  port = app.get 'port'
  env = app.settings.env
  console.log "Express server listening on port #{app.get('port')}"

module.exports = app
