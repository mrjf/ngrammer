url = 'http://' + req.headers.host
demoUrl = url + '/3/text%20to%20be%20ngrammed%20goes%20here'

div class: "container", ->
  
  div class: "header", ->
    h1 'How to use this API'
    div ->
      ul ->
        li -> 
          b -> 'GET: '
          a href: demoUrl, ->
            demoUrl
        li -> 
          b -> 'POST:'
          ul ->
            li -> 'URL: ' + url
            li -> 'Send JSON: {"n": 3, "text": "text to be ngrammed goes here"}'
            li ->
              text 'Get JSON back:'
              tt -> '[["text","to","be"],["to","be","ngrammed"],["be","ngrammed","goes"],["ngrammed","goes","here"]]'
