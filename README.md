# casecheck

This is a Bash version of [case-police][1].

## Usage

```sh
echo -e 'Emacs\nGitHub' >Wordlist
echo 'I love emacs and GITHUB!' | ./casecheck
I love Emacs and GitHub!
```

[1]: https://github.com/antfu/case-police
