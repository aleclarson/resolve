
path = require "path"
fs = require "fsx"

resolveSymlink = require "./resolveSymlink"

resolvePackage = (startPath) ->

  if not fs.isDir startPath
    throw Error "'startPath' must be a directory:\n  #{dirPath}"

  pkgRoot = startPath
  while pkgRoot isnt path.sep

    jsonPath = path.join pkgRoot, "package.json"

    if fs.isFile jsonPath
      return resolveSymlink pkgRoot

    pkgRoot = path.dirname pkgRoot

  return null

module.exports = resolvePackage
