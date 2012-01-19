cleanText = (text) ->
  text = text.replace /\n/g, ' '
  text = text.replace /\r/g, ' '
  text = text.replace /[;:]/g, ' '  
  text = text.replace /\-\-/g, ' '  
  text = text.replace /"/g, ' '  
  text = text.replace '/ +/g', ' '

cleanToken = (token) ->
  token = token.replace /[\!\.\?\,]$/g, ''

tokenize = (text) ->
  tokens = text.split ' '
  tokens = (cleanToken token for token in tokens)
  (token for token in tokens when token.length > 0)

exports.tokenize = tokenize
exports.cleanText = cleanText