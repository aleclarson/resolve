
path = require "path"
fs = require "fsx"

resolveModule = require "./resolveModule"
resolveFile = require "./resolveFile"
resolveDir = require "./resolveDir"

resolvePath = (request, options = {}) ->

  options.exts ?= [".js"]
  options.parent ?= process.cwd()

  if not path.isAbsolute options.parent
    throw Error "'options.parent' must be an absolute path:\n  #{options.parent}"

  if not fs.isDir options.parent
    throw Error "'options.parent' must be a directory:\n  #{options.parent}"

  if request.startsWith "."
    request = path.resolve options.parent, request

  else if not path.isAbsolute request
    request = resolveModule request, options.parent
    return null if not request

  filePath = resolveFile request, options
  return filePath or resolveDir request, options

module.exports = resolvePath
