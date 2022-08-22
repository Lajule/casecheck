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
echo 'I love emacs and GITHUB!' >test
sed -i -f casecheck test
```

[1]: https://github.com/antfu/case-police
