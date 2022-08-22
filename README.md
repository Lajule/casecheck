# casecheck

This is a sed version of [case-police][1].

## Usage

To check if case is correct:

```sh
echo 'I love emacs and GITHUB!' | ./casecheck
I love Emacs and GitHub!
```

To fix the case:

```sh
echo 'I love emacs and GITHUB!' >out
sed -i -f casecheck out
cat out
I love Emacs and GitHub!
```

[1]: https://github.com/antfu/case-police
