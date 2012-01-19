fs = require 'fs'
http = require 'http'
url = require 'url'

request = require 'request'

ngram = require './nlp/ngram.coffee'
tokenize = require './nlp/tokenize.coffee'
stopworder = require './nlp/stopworder.coffee'

Stopworder = new stopworder.Stopworder 4

getUrl = (URL, callback) ->

  request
    uri: URL,
    (err, res, body) ->
      callback body

loadDocument = (filename, callback) ->

  filename = process.cwd() + '/public/' + filename

  fs.readFile filename, 'utf-8', (err, data) ->
    callback data

ngramText = (n, text) ->

    text = tokenize.cleanText text
    tokens = tokenize.tokenize text
    tokens = Stopworder.filter tokens
    ngram.ngram n, tokens


module.exports = (app) ->

  app.get '/', (req, res) ->

    res.render 'info', locals:
      req: req


  app.post '/', (req, res) ->

    n = req.body.n
    text = req.body.text
    ngrams = ngramText n, text
    res.send ngrams


  app.get '/file/:n', (req, res, next) ->

    n = req.n

    loadDocument req.query.file, (text) ->

      ngrams = ngramText n, text
      res.send ngrams


  app.get '/url/:n', (req, res, next) ->

    n = req.n

    getUrl req.query.url, (text) ->

      ngrams = ngramText n, text
      res.send ngrams


  app.get '/:n/:text', (req, res, next) ->

    n = req.n
    text = req.params.text
    ngrams = ngramText n, text

    res.send ngrams


  app.param ':n', (req, res, next, n) ->
    req.n = parseInt n
    next()

