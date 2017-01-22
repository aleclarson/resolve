
path = require "path"
fs = require "fsx"

resolveSymlink = (filePath) ->
  while fs.isLink filePath
    dirPath = path.dirname filePath
    filePath = fs.readLink filePath
    if filePath.startsWith "."
      filePath = path.resolve dirPath, filePath
  return filePath

module.exports = resolveSymlink
