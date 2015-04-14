#!/usr/bin/env bash
# usage: git-clone-init base-repo project-name

baseRepo="$1"
projectName="$2"

# params are required, exit if empty
if [ -z "$baseRepo" ] || [ -z "$projectName" ]; then
    echo "usage: git-clone-init base-repo project-name"
    exit 1
fi

# exit on any error
set -e

git clone "$baseRepo" "$projectName"
cd "$projectName"
rm -rf .git
git init
# replace PROJECT_NAME with projectName in a few files
sed -i'.orig' "s/PROJECT_NAME/$projectName/g" package.json README.md
rm package.json.orig README.md.orig
git add .
git commit -m "Initial commit"

echo "$projectName created"
