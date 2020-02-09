# iOS App Template


## Using

After the repository is cloned you need to remove the `.git` directory so you can do a `git init` to make the repository your own. 

First you need to rename the project using the following command within the root of the project, replacing `<New Project Name>` with the desired name (without whitespaces).
    
`make rename NAME=<New Project Name>`

After that you need to run `make bootstrap` to generate the project and download dependecies.

If you need to regenerate the project you can use `make xcodegen`.

## TODO

- [ ] Tests
- [ ] CI
- [ ] Changelog
