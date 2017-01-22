
fs = require "fsx"

resolveFile = (filePath, options) ->

  if fs.isFile filePath
    return filePath

  if Array.isArray options.exts
    for ext in options.exts
      possiblePath = filePath + ext
      if fs.isFile possiblePath
        return possiblePath

  return null

module.exports = resolveFile
