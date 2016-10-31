async      = require 'async'
_          = require 'underscore'

GoogleSpreadsheet = require 'google-spreadsheet'


module.exports = (app) ->

  app.get '/', (req, res) ->
    res.render 'index'


  app.post '/save', (req, res) ->
    {first_name, last_name, nick_name} = req.body
    doc   = new GoogleSpreadsheet '1XZSHGD2UKKoPx2J6jPVGr1B1BhExroukAh4RE2qzGRo'
    sheet = {}

    async.series

      setAuth: (cb) ->
        creds = require '../creds/google-generated-creds.json'
        doc.useServiceAccountAuth creds, cb

      writeARow: (cb) ->
        row =
          first_name: first_name
          last_name: last_name
          nick_name: nick_name
        doc.addRow 1, row, (err) ->
          cb()

      , (err, results) ->
        res.json 'Did It'
