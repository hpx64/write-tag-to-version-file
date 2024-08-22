# Write tag to version file

A GitHub Action that fetches the latest git tag within a repo and writes this to a file.

## Inputs

### `filename`

**Required** - The filename to write the version tag to.

## Example usage

Commit a file named `version` to the root of your repository. This string will be replaced with the latest git tag in the CI pipeline.

```
name: Write tag to version file
on:
  push:
    branches:
      - master

jobs:
  write-version:
    runs-on: ubuntu-latest
    name: Write version to file
    steps:
    - uses: actions/checkout@master
    - name: Update version
      uses: hpx64/write-tag-to-version-file@master
      with:
        filename: version
```
