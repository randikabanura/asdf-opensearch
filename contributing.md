# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test opensearch https://github.com/randikabanura/asdf-opensearch.git "opensearch --help"
```

Tests are automatically run in GitHub Actions on push and PR.
