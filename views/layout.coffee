doctype 5
html ->
  head ->
    title 'Ngram API'
    meta charset: 'utf-8'

    meta(name: 'description', content: @description) if @description?
    link(rel: 'canonical', href: @canonical) if @canonical?

    link rel: 'icon', href: '/favicon.ico'

    comment 'foo'

    # For now, Blueprint and jQuery / jQuery UI aren't used, but I'm pretty 
    # sure they will be soon. Same with 

    link rel: 'stylesheet', href: 'stylesheets/blueprint/screen.css'
    link rel: 'stylesheet', href: 'stylesheets/humanity/jquery-ui-1.8.11.custom.css'
    link rel: 'stylesheet', href: 'stylesheets/app.css'

    script src: '/js/vendor/jquery-1.6.2.min.js'
    script src: '/js/vendor/jquery-ui-1.8.16.custom.min.js'
    script src: '/js/app.js'

  body ->

      div id: 'wrapper', ->
        @body

