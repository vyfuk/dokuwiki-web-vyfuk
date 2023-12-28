#!/bin/sh
# This script upgrades DokuWiki files to specified tag by resetting all upstream files to their versions.
# (because we cannot simply merge the two repos due to commit squashing in our repo, and the way
# git resolves conflicts between our squashes and the original code)

# Check if tag even exists
TAG="tags/$1"
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo "Tag found!";
else
    echo "Unknown tag supplied";
    exit 1;
fi

# Branch to be updated
TARGET=$(git branch --show-current)

# Checkout tag
git checkout "$TAG" --detach

# Get files to be reseted
FILES=$(ls -a -I '.docker*' -I 'docker*' -I '.git*' -I '*.sh' -I '.' -I '..' -I '.vscode' -I 'conf' -I 'data')

# Go back to target branch and start resetting
git checkout "$TARGET"
for file in $FILES; do
    rm -rf $file
    git checkout "$TAG" -- $file
done

# Reinitalize all submodules
git submodule update --init

# Remove unittest folder
rm -rf _tests

echo "Done! Don't forget to check for changes in conf folder"