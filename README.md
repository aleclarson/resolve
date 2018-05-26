
# resolve v1.0.1

```coffee
{resolvePath} = require "resolve"

result = resolvePath request, {parent, exts}
```

- Resolves a module name (eg: `leftpad`) into its index file
- Resolves symlinks recursively
- Searches $NODE_PATH as a fallback
- Traverses up the parent tree, looking in each `node_modules` dir
- Resolves directories by looking for `package.json` or index file

### resolveFile(filePath, options)

Tries resolving a file path using a set of extensions.

```coffee
{resolveFile} = require "resolve"

result = resolveFile filePath, {exts}
```

### resolveDir(dirPath, options)

Search a directory for its index file.

```coffee
{resolveDir} = require "resolve"

result = resolveDir dirPath, {exts}
```

### resolveModule(request, parent)

Search local & global `node_modules` directories for a module.

If you want a file path, use `resolveFile` afterwards.

```coffee
{resolveModule} = require "resolve"

result = resolveModule request, parent
```

### resolvePackage(filePath)

Find the nearest directory that contains a `package.json` file.

```coffee
{resolvePackage} = require "resolve"

result = resolvePackage filePath
```

### resolveSymlink(filePath)

Resolves a symlink recursively.

Handles relative symlinks correctly.

```coffee
{resolveSymlink} = require "resolve"

result = resolveSymlink filePath
```
