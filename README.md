# vim_config

Configurations and plugins for Vim.

## 1. Setup Vim

### Using git to track dotfiles

```
$ mv .vimrc ~/.vim/vimrc
$ ln -s ~/.vim/vimrc ~/.vimrc
$ cd ~/.vim
$ git init
$ git add .
$ git commit -m "Initial commit"
```

### Install configurations on a new machine

* Linux

```
$ cd ~
$ git clone https://github.com/rxdu/vim_config.git ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ cd ~/.vim
$ git submodule update --init --recursive
```

* MacOS

```
$ sudo port install vim +python27 +huge

#Add an alias in the ~/.bash_profile
alias vim='/opt/local/bin/vim'
```

### Additional setups

* Colorscheme

Add the following variable to .bashrc to show color correctly.
```
export TERM=xterm-256color
```

<!--
* YouCompleteMe

```
$ cd ~/.vim/bundle/YouCompleteMe
$ python3 install.py --clang-completer
```
-->

### Plugin dependencies

ctags: required by Gutentags, TagBar

* Linux

```
$ sudo apt-get install exuberant-ctags
```
* MacOS

```
$ brew install ctags-exuberant
```

<!--
* ~~libclang > 3.8: required by YouCompleteMe~~

```
$ wget <clang-binaries-tarball-url> #  or `curl -O <url>`
$ tar xf clang*
$ cd clang*
$ sudo cp -R * /usr/local/
```
```
$ brew install clang-format
```
-->

## 2. Manage plugins

See [PLUGIN](PLUGIN.md)

## 3. Using vim

See [CHEATSHEET](CHEATSHEET.md)

## 4. Plugins installed

* [Pathogen](https://github.com/tpope/vim-pathogen): runtime path management
* [vim-cpp-modern](https://github.com/bfrg/vim-cpp-modern): C++ highlight
* [Vim-Clang-Format](https://github.com/rhysd/vim-clang-format): format code using clang-format
* [Gutentags](https://github.com/ludovicchabant/vim-gutentags): quick reference to symbols/functions
* [TagBar](https://github.com/majutsushi/tagbar)
* [c.vim](http://www.vim.org/scripts/script.php?script_id=213): C/C++ support
* [vim-code-dark](https://github.com/tomasiser/vim-code-dark): vs code dark color scheme
* [lightline](https://github.com/itchyny/lightline.vim): a better-looking status bar
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim): file/buffer quick search/switch
* [vim-cmake](https://github.com/vhdirk/vim-cmake)
* [vim-markdown](https://github.com/plasticboy/vim-markdown.git)
* [nerdtree](https://github.com/scrooloose/nerdtree.git)
* [fugitive](https://github.com/tpope/vim-fugitive.git): git support
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [vim-eunuch](https://github.com/tpope/vim-eunuch.git)
* [vim-surround](https://github.com/tpope/vim-surround.git)
* [ale](https://github.com/w0rp/ale.git): linting/fixing
* [vim-clang](https://github.com/justmao945/vim-clang): parse and complete C/C++ source files
* [vim-buftabline](https://github.com/ap/vim-buftabline.git)
* ~~[Vim-Cpp-Enhanced-Highlight](https://github.com/octol/vim-cpp-enhanced-highlight): C++ highlight~~
* ~~[colorsbox](https://github.com/mkarmona/colorsbox): color scheme for VIM (not used by default)~~
* ~~[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) - terminal [color scheme](https://github.com/altercation/solarized)~~
* ~~[YouCompleteMe](https://github.com/Valloric/YouCompleteMe): auto completion~~
* ~~[YCM-Generator](https://github.com/rdnetto/YCM-Generator): YouCompleteMe configuration file generator~~

<!--

## 3. Extra information for plugin installation
cb 
**YouCompleteMe**

* Install YCM using git add submodule
```
$ git submodule add https://github.com/Valloric/YouCompleteMe.git
$ git submodule update --init --recursive
```
* Download latest version of [libclang](http://llvm.org/releases/download.html). You can install it to the system directory if you want. Follow the above instructions.

* First try to use the provided script to install this plugin:

```
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

* Compile ycm_core library with C-family support
```
$ cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/usr/local . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
$ cmake --build . --target ycm_core --config Release
```
Replace the PATH_TO_LLVM_ROOT if you have it extracted elsewhere.
)

-->

## 5. Candidnate plugins

* [Ultisnips](https://github.com/SirVer/ultisnips)

## Reference:

Configuration
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
* http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules
* http://dougblack.io/words/a-good-vimrc.html
* https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

Plugin documentation
* https://lug.fh-swf.de/vim/vim-c/c-hotkeys.pdf

Resource
* https://github.com/tpope/vim-pathogen
