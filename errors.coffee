class NotFound extends Error
  constructor: (path) ->
    @.name = 'NotFound'

    if path
      Error.call @, "Cannot find #{path}"
      @.path = path
    else
      Error.call @, "Not Found"

    Error.captureStackTrace @, arguments.callee

# This is handy function to replace the value of an URL param
# replaceRouteParam = (req, param, replacement) ->
#   segments = req.app.routes.routes.get[req._route_index].path.split('/')
#   new_segments = []
#   for segment in segments
#     if segment is param
#       new_segments.push replacement
#     else if segment[0] is ':'
#       new_segments.push req.params[segment[1..]]
#     else
#       new_segments.push segment
# 
#   new_segments.join '/'


module.exports = (app) ->

  app.error (err, req, res, next) ->
    console.log 'Error handler', err
    console.log err.stack
    if err instanceof NotFound
      res.render '404', status: 404
    else
      res.render '500', status: 500

  return {
    NotFound: NotFound
    }

