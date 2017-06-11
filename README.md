# vile-synt [![CircleCI](https://circleci.com/gh/forthright/vile-synt.svg?style=shield)](https://circleci.com/gh/forthright/vile-synt) [![Build status](https://ci.appveyor.com/api/projects/status/34p27h7gqyld3rre/branch/master?svg=true)](https://ci.appveyor.com/project/brentlintner/vile-synt/branch/master) [![Build Status](https://travis-ci.org/forthright/vile-synt.svg?branch=master)](https://travis-ci.org/forthright/vile-synt) [![score-badge](https://vile.io/api/v0/projects/vile-synt/badges/score?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-synt) [![security-badge](https://vile.io/api/v0/projects/vile-synt/badges/security?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-synt) [![coverage-badge](https://vile.io/api/v0/projects/vile-synt/badges/coverage?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-synt) [![dependency-badge](https://vile.io/api/v0/projects/vile-synt/badges/dependency?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-synt)

A [vile](https://vile.io) plugin for finding similar functions and
classes in your TypeScript/JavaScript code (via [synt](https://github.com/brentlintner/synt)).

## Requirements

- [NodeJS](http://nodejs.org)

## Installation

    npm i -D vile vile-synt

## Config

*example (using synt defaults):*

```yaml
synt:
  config:
    similarity: 70
    ngram: 1
    minlength: 10
    estype: "module"
```

## Ignoring Files

```yaml
synt:
  ignore:
    - src/@types
```

## Allowing Files

```yaml
synt:
  allow:
    - src
```

## Vile Types Generated

* `vile.DUPE`

## Versioning

This project ascribes to [semantic versioning](http://semver.org).

## Licensing

This project is licensed under the [MPL-2.0](LICENSE) license.

Any contributions made to this project are made under the current license.

## Contributions

Current list of [Contributors](https://github.com/forthright/vile-synt/graphs/contributors).

Any contributions are welcome and appreciated!

All you need to do is submit a [Pull Request](https://github.com/forthright/vile-synt/pulls).

1. Please consider tests and code quality before submitting.
2. Please try to keep commits clean, atomic and well explained (for others).

### Issues

Current issue tracker is on [GitHub](https://github.com/forthright/vile-synt/issues).

Even if you are uncomfortable with code, an issue or question is welcome.

### Code Of Conduct

This project ascribes to [contributor-covenant.org](http://contributor-covenant.org).

By participating in this project you agree to our [Code of Conduct](CODE_OF_CONDUCT.md).

### Maintainers

- Brent Lintner - [@brentlintner](http://github.com/brentlintner)

## Developing

    cd vile-synt
    npm i
    npm run compile
    npm t
