<div align="center">

# asdf-opensearch [![Build](https://github.com/randikabanura/asdf-opensearch/actions/workflows/build.yml/badge.svg)](https://github.com/randikabanura/asdf-opensearch/actions/workflows/build.yml) [![Lint](https://github.com/randikabanura/asdf-opensearch/actions/workflows/lint.yml/badge.svg)](https://github.com/randikabanura/asdf-opensearch/actions/workflows/lint.yml)


[opensearch](https://github.com/opensearch-project/OpenSearch) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

## Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

## Dependencies

- `bash`, `curl`, `tar` or `unzup` : generic POSIX utilities.

## Install

Plugin:

```shell
asdf plugin add opensearch https://github.com/randikabanura/asdf-opensearch.git
```

opensearch:

```shell
# Show all installable versions
asdf list-all opensearch

# Install specific version
asdf install opensearch latest

# Set a version globally (on your ~/.tool-versions file)
asdf global opensearch latest

# Now opensearch commands are available
opensearch --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/randikabanura/asdf-opensearch/graphs/contributors)!

## Author
Name: [Banura Randika Perera](https://github.com/randikabanura) <br/>
Linkedin: [randika-banura](https://www.linkedin.com/in/randika-banura/) <br/>
Email: [randika.banura@gamil.com](mailto:randika.banura@gamil.com) <br/>
Bsc (Hons) Information Technology specialized in Software Engineering (SLIIT)

## Show your support

Please ⭐️ this repository if this project helped you!

## License

See [LICENSE](LICENSE) © [randikabanura](https://github.com/randikabanura/)
