#  We don't require sessions at the moment but this is nice boilerplate to
# have around.

exports.requiresSession = (req, res, next) ->

  if req.session.user
    next()
  else
    res.redirect '/login?redirect=' + req.url
