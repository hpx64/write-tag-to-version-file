#!/bin/sh
set -eo pipefail

error() {
    echo -e "\x1b[1;31m$1\e[0m $2"
}

log() {
    echo -e "\x1b[1;32m$1\e[0m $2"
}

filename=$1
user_name=$2
user_email=$3

log "File name:" "$filename"
log "File content:" "$content"

git fetch --tags --force
latestVersionTag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
log "Latest version tag:" "$latestVersionTag"

log "Write version tag to file"
echo "$latestVersionTag" > "$filename"

log "Add user.name and user.email to config"
git config user.name "$user_name"
git config user.email "$user_email"
  
log "Add version file and commit"
git add version
git commit -m "Update version file"
git push
