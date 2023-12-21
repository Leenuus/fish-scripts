## Fish Scripts

### Pitfalls

1. When using `test -n <string>` to test whether a variable is set, do remember double quote the variable name!!! This form is right: `test -n "$arg"`, and the following one always return true: `test -n $arg`; but `test -z <string>` do not act in this manner, you can omit the quotes around the variable name when using `-z` to test whether a string's length is 0.


### Project Overview

Some useful fish scripts

- [git shortcuts](./git.fish)
- [simple project switcher](./quick-switch.fish)
- [navigate faster in fish](./go.fish)
- [quick switch to new dir](./functions/gtmp.fish)
- [quick open dolphin file manager in terminal](./functions/ex.fish)
- [quick open README](./functions/readme.fish)
- [quick launch a http server, python needed](./functions/http-server.fish)
