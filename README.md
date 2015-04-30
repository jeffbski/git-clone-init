# git-clone-init - create new project from clone

Creates a new `git-clone-init` script in your path which can be used to quickly creates a new project from a git clone. [See below for details](#what-it-does) of how it operates.

## Usage

```bash
npm install -g git-clone-init # install once

# when you want to create new project, cd to a parent directory
# run git-clone-init with gitPath and your desired projectName
# it clones and inits into a new folder projectName
git-clone-init https://github.com/jeffbski/base-react-min.git projectName

# You may use gitURLs or local paths to a git project
git-clone-init ~/projects/base-react projectName
```

## Requirements

 - requires bash

## What it does

This is a rough summary of the commands it performed, see `git-clone-init.bash` for full details.

```bash
baseRepo="$1"
projectName="$2"

# ... verify params, ensure target directory doesn't exist

# exit on any error
set -e

# clone and re-init
git clone "$baseRepo" "$projectName"
cd "$projectName"
rm -rf .git
git init

# replace PROJECT_NAME with projectName in a few files
sed -i'.orig' "s/PROJECT_NAME/$projectName/g" package.json README.md
rm package.json.orig README.md.orig

# initial commit
git add .
git commit -m "Initial commit"
```


## Rationale

In order to create new projects, I need a way to quickly setup a structure and copy in some files. I wanted something easier and lighter than a yeoman generator and since I normally just do this with git clone, I figured I could easily wrap up a few commands in this bash script.

It does simple inline replace with sed for PROJECT_NAME in package.json and README.md.

If you need anything more complex, check out yeoman generators.
