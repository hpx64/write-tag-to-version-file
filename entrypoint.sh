#!/bin/sh
set -eo pipefail

error() {
    echo -e "\x1b[1;31m$1\e[0m $2"
}

log() {
    echo -e "\x1b[1;32m$1\e[0m $2"
}

filename=$1

log "File Name:" "$filename"

if test -f "$filename"; then
    content=$(cat "$filename")
else
    error "Version file not found! Looked for:" "$filename"
    exit 1;
fi

log "File Content:" "$content"

git fetch --tags --force
latestVersionTag=$(git describe --tags "$(git rev-list --tags --max-count=1)")

log "Latest version tag:" "$latestVersionTag"

echo "$latestVersionTag" > "$filename"

log "Add version file and commit"

git add version

git commit -m "Update version file"
