# .dotfiles

This repository contains my Bash, ZSH, and NeoVim settings.

Some of the features include:

* Nicely colored prompt for both Bash and ZSH.
* Automatic project aliases
* Lots of cool aliases
* Ruby on Rails specific aliases
* RVM and rbenv support
* Vim configuration
* ... and much more!

There is absolutely NO guarantee for this project to work on your machine.
Only use this if you know what you are doing.

## Increase Key Repeat
I like to increase the key repeat beyond what Mac OS X provides in the Preferences. I do this with the following commands:

``` bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

It requires a restart / logout-login in order to work

In Ubuntu there is a Key Repeat item in the Accessibility menu. Move the speed slider to the left in
order to increase the key repeat.

## Ubuntu Remapping keys

I like to set the Caps Lock to Ctrl in Mac OS X. But in Ubuntu it's a little bit harder to achieve.

Go to `Ubuntu Software` and search for `Gnome Tweak` and install. Open the tool and go to Keyboard
& Mouse > Keyboard > Additional Layout Options > Caps Lock behavior. Change this to Control.

## Installation

### Prerequisites

#### All systems
* [ASDF](https://asdf-vm.com/)

#### Mac OS X
* Xcode (download from App store)
* [iTerm2](http://www.iterm2.com/)
* [Homebrew](http://mxcl.github.io/homebrew/)

#### Ubuntu
Ubuntu should pretty much be ready to go. Just make sure you have a decent Terminal app installed. I prefer one where I can have Split Panes.
I recomment [Tilix](https://gnunn1.github.io/tilix-web/)

### Homebrew

Here's what I install on a clean OSX:

```bash
brew install ack wget zsh readline gnugp
```

### Ubuntu Apt-get

Here's what I install on a clean OSX:

```bash
sudo apt upgrade
sudo apt install ack wget zsh
sudo apt install libreadline7 libreadline-dev
```

### dotfiles

To install the dotfiles:

```bash
git clone https://github.com/hacklor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/install
```

This will create backups for anything you already have and add symlinks to
these parts.

### Git

Add and change these lines to `~/.dotfiles/config/personal.sh`:

``` bash
export GIT_AUTHOR_NAME="Your Name"
export GIT_AUTHOR_EMAIL="yourname@yourdomain.com"

export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
```

See the chapter on personal configuration below for more information.

## Customizing

### iTerm2

In the iTerm2 General settings, check `Load preferences from a user-defined
folder or URL`. Fill in the text field to point to
`/Users/your_name/.dotfiles/iterm2`. You might need to restart iTerm2 after
that.

### NeoVim
Many plugins need python support in order to work.

```bash
brew install python3
pip3 install neovim --upgrade
```

To make sure that NeoVim uses the correct version of Python, the following line is added to vimrc

```bash
let g:python3_host_prog = '/usr/local/bin/python3'
```

```bash
brew install neovim
```

```bash
# For Ubuntu, check which one is available
sudo apt search neovim
sudo apt install neovim
```

### Vim Plugins

Vim Plugins will automatically install themselves when you start Vim for the first time.

Delete (or move) your `~/.vim` directory to let it install.

### Personal Configuration

You can put configuration options that are personal, like custom paths, and
other environment variables in one of these files:

* `config/personal.sh` (will be loaded in both Bash and ZSH)
* `config/personal.zsh` (ZSH specific configuration)
* `config/personal.bash` (Bash specific configuration)

### Project aliases

This scripts adds aliases for your project directories, but you'll have to tell
it where your projects can be found. There are however differences in ZSH and
Bash syntax. Use the personal configuration files as mentioned above to set
them.

For ZSH:

    PROJECT_PARENT_DIRS+=("$HOME/Work")
    PROJECT_PARENT_DIRS+=("$HOME/Personal")

For Bash:

    PROJECT_PARENT_DIRS[0]="$HOME/Work"
    PROJECT_PARENT_DIRS[0]="$HOME/Personal"

Add as many directories as you like.

### Fonts

I'm using DejaVuSansMono as font. You can download it [here](http://dejavu-fonts.org/wiki/Download).

My DejaVuSansMono, including the [powerline](https://github.com/Lokaltog/vim-powerline)
patch is included for convenience.

## Development Tools
[Running IE on Mac using VirtualBox](https://github.com/xdissent/ievms)

## Credits

Thanks everybody who puts their dotfiles online. I copied a lot from
practically every repository.

Feel free to use this or fork this. Additions are very welcome!
