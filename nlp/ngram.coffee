ngram = (n, sequence) ->

  return null if sequence.length < n
  ngrams = []

  for start in [0 .. sequence.length - n]
    ngrams.push((sequence[i] for i in [start .. start + n - 1]))

  ngrams

exports.ngram = ngram
