# git-clone-init - create new project from clone

Creates a new `git-clone-init` script in your path which can be used to quickly creates a new project from a git clone. It uses roughly these bash commands:

```bash
baseRepo="$1"
projectName="$2"

# ... verify params

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

## Usage

```bash
npm install -g git-clone-init # install once

# when you want to create new project, cd to a parent directory
# run git-clone-init with gitPath and your desired projectName
# it clones and inits into a new folder projectName
git-clone-init https://github.com/jeffbski/base-react-min.git projectName
```

## Requirements

 - requires bash

## Details

In order to create new projects, I need a way to quickly setup a structure and copy in some files. I wanted something easier and lighter than a yeoman generator and since I normally just do this with git clone, I figured I could easily wrap up a few commands in this bash script.

It does simple inline replace with sed for PROJECT_NAME in package.json and README.md.

If you need anything more complex, check out yeoman generators.
