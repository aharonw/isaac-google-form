express      = require 'express'
bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'
session      = require 'express-session'
path         = require 'path'
coffee       = require 'coffee-middleware'

app = module.exports = express()

app.set 'port', 300
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use bodyParser.json()
app.use bodyParser.urlencoded { extended: true }

app.use express.static __dirname + '/../public'

port = process.env.PORT or 3000

require('./routes') app

app.listen port,
  console.log '\x1b[32m********************************\x1b[0m'
  console.log '\x1b[32m*** Isaac Google Form Online on ' + port + ' ***\x1b[0m'
  console.log '\x1b[32m********************************\x1b[0m'
