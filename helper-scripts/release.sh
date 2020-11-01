##!/bin/bash
#
# This script helps to create a new release
# Usage: ./release.sh major|minor|patch
#

CURRENT_VERSION=$(cat ../VERSION | cut -d ' ' -f 1)
NEW_VERSION=v$(./semver bump $1 $CURRENT_VERSION)

echo "Current version : $CURRENT_VERSION"
echo "New version     : $NEW_VERSION"

read -p "Are you sure you want to proceed? [y/N]" proceed

if [ $proceed = "xy" ]
then
  echo "Create new release ($NEW_VERSION)"
  echo $NEW_VERSION > ../VERSION
else
  echo "Operation aborted"
fi
