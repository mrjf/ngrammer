url = 'http://' + req.headers.host
demoUrl = url + '/3/text%20to%20be%20ngrammed%20goes%20here'
fileUrl = url + '/file/3?file=mobydick_short.txt'
urlUrl = url + '/url/3?url=' + url + '/mobydick_short.txt'

div class: "container", ->
  
  h3 'What is this?'
  div class: 'prepend-4 span-16 append-4 last', ->
    text 'A very simple API server for ngram generation, inspired by '
    a href: 'http://www.interedition.eu/', ->
      'the Interedition #9 symposium in Leuven, 2012'
    text ', written in '
    a href: 'http://coffeescript.org', ->
      'CoffeeScript'
    text ' using the '
    a href: 'http://expressjs.com/', ->
      'Express'
    text ' web framework for '
    a href: 'http://nodejs.org/', ->
      'Node.js'
    text ', along with '
    a href: 'http://coffeekup.org/', ->
      'CoffeeKup'
    text ' for templating and '
    a href: 'https://github.com/joshuaclayton/blueprint-css', ->
      'Blueprint'
    text ' for CSS.'

    h3 'How to use this API'
    div class: 'span-24 last', ->
      ul ->
        li -> 
          b -> 'GET: '
          ul ->
            li ->
              text "Text as query param: "
              a href: demoUrl, ->
                demoUrl

            li ->
              text 'Text from server file: '
              a href: fileUrl, ->
                fileUrl

            li ->
              text 'Text from remote URL: '
              a href: urlUrl, ->
                urlUrl


        li -> 
          b -> 'POST:'
          ul ->
            li -> 'URL: ' + url
            li -> 'Send JSON: {"n": 3, "text": "text destined to be ngrammed sits here"}'
            li ->
              text 'Get JSON back:'
              tt -> '[["text","destined","ngrammed"],["destined","ngrammed","sits"],["ngrammed","sits","here"]]'

      div 'Currently using simple English stopwording, and stripping some puncuation. Look for more options to be added.'
