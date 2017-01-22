
path = require "path"
fs = require "fsx"

resolveFile = require "./resolveFile"

resolveDir = (dirPath, options) ->

  if not fs.isDir dirPath
    return null

  jsonPath = path.join dirPath, "package.json"
  if fs.isFile jsonPath
    json = fs.readFile jsonPath
    try json = JSON.parse json
    catch error then throw Error "Failed to parse JSON:\n  #{jsonPath}\n\n#{error.message}"
    if json and json.main
      mainPath = path.resolve dirPath, json.main
      filePath = resolveFile mainPath, options
      return filePath or resolveDir mainPath, options

  mainPath = path.join dirPath, "index"
  return resolveFile mainPath, options

module.exports = resolveDir
