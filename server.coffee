require 'coffee-script'
express = require 'express'
stylus = require 'stylus'

app = express.createServer()
app.use express.bodyParser()
app.use express.cookieParser()
# Sessions not currently used
app.use express.session secret: "supahseecret"

# CoffeeKup Template Engine
app.register '.coffee', require 'coffeekup'
app.set 'view engine', 'coffee'

# Stylus CSS engine
app.use stylus.middleware
  src: __dirname + '/views'
  dest: __dirname + '/public'

# Static Files
app.use express.static __dirname + '/public'

# Favicon
app.use(express.favicon(__dirname + '/public/favicon.ico'));

# Routes
routes = require('./routes.coffee') app

# Errors
# Not using currently
# errors = require('./errors.coffee') app

app.listen 8080
