# dotfiles

<!-- markdownlint-disable MD013 -->

<!-- markdownlint-disable MD037 -->

```
  _____   ____ _______ ______ _____ _      ______  _____                        _
 |  __ \ / __ \__   __|  ____|_   _| |    |  ____|/ ____|             ____     | |
 | |  | | |  | | | |  | |__    | | | |    | |__  | (___    ______    / __ \  __| |_   ____ _
 | |  | | |  | | | |  |  __|   | | | |    |  __|  \___ \  |______|  / / _` |/ _` \ \ / / _` |
 | |__| | |__| | | |  | |     _| |_| |____| |____ ____) |          | | (_| | (_| |\ V / (_| |
 |_____/ \____/  |_|  |_|    |_____|______|______|_____/            \ \__,_|\__,_| \_/ \__, |
                                                                     \____/             __/ |
                                                                                       |___/
```

<!-- markdownlint-enable MD037 -->

- [dotfiles](#dotfiles)
  - [Synopsis](#synopsis)
  - [Motivation](#motivation)
    - [Prerequisites](#prerequisites)
  - [Getting Started and installing](#getting-started-and-installing)
  - [Running the tests](#running-the-tests)
  - [Built With](#built-with)
  - [TODO](#todo)
  - [Contributing](#contributing)
  - [Authors](#authors)
  - [License](#license)

## Synopsis

> A collection of dotfiles to set up your linux environment faster.

## Motivation

Having to setup everything new when switching systems is annoying. This repository has the aim of automating all the boring work of installing applications and creating configuration files on new system.

### Prerequisites

The scripts on this repository has been tested on `Ubuntu 18.04` and partially on `Ubuntu 16.04`. Nevertheless, feel free to try what works on your system.

## Getting Started and installing

1. Clone the repository or get the latest [stable release](https://github.com/daniel-vera-g/dotfiles/releases) and unpack it in your home directory.
2. Execute the install script: `./INSTALL.sh`

This will install all the applications listed under the `linux/apps/` directory, run some tests on this applications after installing(Tests located in `/tests/apps/`) and simlink all the configuration files located in `/linux/shell/`.

> If `INSTALL.sh` is not already shown as executable, you have to do this manually: `chmod +x ./INSTALL.sh`

## Running the tests

You can run tests for either application installing or config file simlinking individually:

1. Application installing located in: `tests/apps/`
2. Config simlinking located in: `tests/shell/`

## Built With

Just plain bash and python for testing :).

## TODO

1. See the [issue](https://github.com/daniel-vera-g/dotfiles/issues) tracker
2. Create dotfiles for OSX(Not planned)

## Contributing

1. Just fork the repository, pick some [issue](https://github.com/daniel-vera-g/dotfiles/issues) fix it and make a pull request.
2. Just go to the [issue](https://github.com/daniel-vera-g/dotfiles/issues) tracker and open an issue if you feel something is missing.

## Authors

- [daniel-vera-g](https://github.com/daniel-vera-g)

## Development

- The latest "stable" version is published as release
- The current `master` branch is considered unstabled

## License

MIT License

Copyright (c) 2019

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
