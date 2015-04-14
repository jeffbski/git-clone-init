# git-clone-init - create new project from clone

Create a new project by:

 - git clone baseRepo projectName
 - cd projectName
 - rm -rf .git
 - git init
 - sed s/PROJECT_NAME/$projectName/g package.json README.md
 - git add .
 - git commit -m "Initial commit"

## Usage

```bash
npm install -g jeffbski/git-clone-init
git-clone-init baseRepo projectName
```

## Details

In order to create new projects, I need a way to quickly setup a structure and copy in some files. I wanted something easier and lighter than a yeoman generator and since I normally just do this with git clone, I figured I could easily wrap up a few commands in this bash script.

If you need anything more complex, check out yeoman generators.
