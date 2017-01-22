
path = require "path"
fs = require "fsx"

resolveSymlink = require "./resolveSymlink"
resolvePackage = require "./resolvePackage"

resolveModule = (request, parent) ->
  if modulePath = searchLocalRoots request, parent
  then modulePath else searchGlobalRoots request

module.exports = resolveModule

#
# Helpers
#

globalRoots = process.env.NODE_PATH
  .split ":"
  .filter fs.isDir

searchGlobalRoots = (request) ->
  requestParts = request.split path.sep
  moduleName = requestParts.shift()
  for globalRoot in globalRoots
    modulePath = path.join globalRoot, moduleName
    if fs.isDir modulePath = resolveSymlink modulePath
      return path.join modulePath, requestParts.join path.sep
  return null

searchLocalRoots = (request, parent) ->
  requestParts = request.split path.sep
  moduleName = requestParts.shift()
  while parent isnt path.sep
    if parentRoot = resolvePackage parent
      modulePath = path.join parentRoot, "node_modules", moduleName
      if fs.isDir modulePath = resolveSymlink modulePath
        return path.join modulePath, requestParts.join path.sep
    parent = path.dirname parent
  return null
