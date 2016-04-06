# Git commit message hook

This `commit-msg` hook enforces the typical commit message structure
as described in [Tim Pope's seminal blog post][tpope]:

* Capitalized subject line of up to 50 characters, not punctuated.
* Body wrapped at 72 characters.

It is mainly useful for environments with editors that don't format commit
messages this way automatically.

For an optimal feedback cycle, the whole message is validated.

To install,
copy or symlink `commit-msg` to the desired repository's `.git/hooks` directory.
Test it with something like `git commit --allow-empty -m "test."`.

The included makefile is purely for testing purposes and can be ignored.

[tpope]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
