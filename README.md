# zsh
My zsh configuration files

Works on Linux, *BSD and OSX, tested on Ubuntu, CentOS, Debian, FreeBSD and several versions of macOS.


### Supported plugins

There is native support for:
 - [homebrew](https://brew.sh/);
 - [zoxide](https://github.com/ajeetdsouza/zoxide), if not installed falls back to zsh-z native plugin;
 - kubectl;
 - [krew](ihttps://krew.sigs.k8s.io/);
 - [pyenv](https://github.com/pyenv/pyenv);
 - [thefuck](https://github.com/nvbn/thefuck)

 These plugins must be installed in another way, I only support using them

 There is also native support for [iTerm2](https://iterm2.com/) shell integration, if you are running on macOS

### Installation

- Clone recurively this repo in `/etc/zsh`: `sudo git clone --recurse <url> /etc/zsh`;
- Copy `/etc/zsh/zshrc` in `/etc`;
- Done

**NOTE**: on macOS with each update of the OS, the file `/etc/zshrc` is restored to the default, you will have to copy again the one in `/etc/zsh`: `sudo cp /etc/zsh/zshrc /etc/zshrc`

If you prefer to avoid touching `/etc/` you can clone the repo in `~/.zsh` and copy the `zshrc` into `~/.zshrc`: `cp ~/.zsh/zshrc ~/.zshrc`, but then you have to add your own customisations to `.zshrc` at the end of the file.
