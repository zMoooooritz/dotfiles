# arch-config

This repo contains the most important dotfiles of my configuration

## Installation

To deploy these dotfiles properly the following steps are necessary:

1. install the application [dotdrop](https://github.com/deadc0de6/dotdrop)
2. create the directory `~/.dotfiles` and `cd` into it
3. `git clone` this repository into the directory `dotfiles`
4. sym-link the `config.yaml` (`ln -s ./dotfiles/config.yaml config.yaml`)
5. edit the `config.yaml` as needed (at least the host name to fit your machine)
6. create the required pwd-files in `~/.local/share/pwd` as seen when `dotdrop compare` is run
7. run `dotdrop install` (`-t` for a dry/temporary-run) and confirm the according changes
8. profit?!

## Contributing

Pull requests are welcome. Please create an issue to discuss the changes that you like to introduce to the dotfiles.

## License

[Nothing to see here](https://www.omfgdogs.com/#)

