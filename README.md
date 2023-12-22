## Fish Scripts

### Pitfalls

1. When using `test -n <string>` to test whether a variable is set, do remember double quote the variable name!!! This form is right: `test -n "$arg"`, and the following one always return true: `test -n $arg`; but `test -z <string>` do not act in this manner, you can omit the quotes around the variable name when using `-z` to test whether a string's length is 0.


### Project Overview

Some useful fish scripts

- [git shortcuts](./git.fish)
- [simple project switcher](./quick-switch.fish)
- [navigate faster in fish](./go.fish)
- [quick open and switch to temporary dir](./functions/gtmp.fish)
- [quick open dolphin file manager in terminal](./functions/ex.fish)
- [quick launch a http server, python needed](./functions/http-server.fish)
- [quick edit common used configurations](./functions/config.fish)
- [quick edit README](./functions/readme.fish)
- [quick edit `.gitignore` file](./functions/ignore.fish)
- [quick edit a script](./functions/tt.fish)
- [set proxy server](./proxy.fish)
- [test a program, with some reminder text before it](./functions/report.fish)
