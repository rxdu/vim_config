# vim_config

Configurations and plugins for Vim.

## 1. Commands

**Setting up vim**

* Using git to track dotfiles
```
$ mv .vimrc ~/.vim/vimrc
$ ln -s ~/.vim/vimrc ~/.vimrc
$ cd ~/.vim
$ git init
$ git add .
$ git commit -m "Initial commit"
```

* Install Pathogen
```
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

add command to vimrc
```
execute pathogen#infect()
```

* Install plugins as submodules
```
$ cd ~/.vim/bundle
$ git submodule add <git-repo-url>
$ git add .
$ git commit -m "plugin info"
```

* Install configurations on another machine
```
$ cd ~
$ git clone <your-vim-dotfile-repo-url> ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ cd ~/.vim
$ git submodule update --init --recursive
```

* Upgrade a plugin bundle/all bundles
```
$ cd ~/.vim/bundle/<plugin-to-be-updated>
$ git pull origin master
```
or
```
$ git submodule foreach git pull origin master
```

* Ignore changes in submodules

Add "ignore = dirty" to the entry in .gitmodules. It should look like:
```
[submodule "bundle/fugitive"]
	path = bundle/fugitive
	url = git://github.com/tpope/vim-fugitive.git
	ignore = dirty
```

**Using vim**

* General vim commands
```
/pattern	# search forward
?pattern	# search backward
n			# repeat search in same direction
N			# repeat search in opposite direction
```

* Invoke clang-format:
```
:ClangFormat
```

* Invoke YCM-Generator to generate .ycm_extra_conf.py for the project
```
:YcmGenerateConfig
```

* C-support
```
\cc		# code to comment //
\co		# comment // to code
```

* Tags
```
ctrl+]	# jump to tag
ctrl+t	# return from tag
```

* CtrlP
```
ctrl+p	# invoke CtrlP in file find mode
f5			# purge cache
ctrl+f/b 	# cycle between modes
ctrl+j/k	# navigate the result list
ctrl+t/v 	# open the selected entry in a new tab or split
```

## 2. Plugins installed

* [Pathogen](https://github.com/tpope/vim-pathogen): runtime path management
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): auto completion
* [YCM-Generator](https://github.com/rdnetto/YCM-Generator): YouCompleteMe configuration file generator
* [Vim-Cpp-Enhanced-Highlight](https://github.com/octol/vim-cpp-enhanced-highlight): C++ highlight
* [Vim-Clang-Format](https://github.com/rhysd/vim-clang-format): format code using clang-format
* [Gutentags](https://github.com/ludovicchabant/vim-gutentags): quick reference to symbols/functions
* [c.vim](http://www.vim.org/scripts/script.php?script_id=213): C/C++ support
* [colorsbox](https://github.com/mkarmona/colorsbox): color scheme for VIM (not used by default)
* [lightline](https://github.com/itchyny/lightline.vim): a better-looking status bar
* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim): file/buffer quick search/switch

## 3. Plugin dependencies

* libclang > 3.8: required by YouCompleteMe
```
$ wget <clang-binaries-tarball-url> #  or `curl -O <url>`
$ tar xf clang*
$ cd clang*
$ sudo cp -R * /usr/local/
```

* ctags: required by Gutentags
```
$ sudo apt-get install exuberant-ctags
```

## 4. Extra information for plugin installation

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

**Colorscheme**

Add the following variable to .bashrc to show color correctly.
```
export TERM=xterm-256color
```

## 5. Plugins interested

* [Ultisnips](https://github.com/SirVer/ultisnips)

## Reference:

Configuration
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
* http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules
* http://dougblack.io/words/a-good-vimrc.html

Plugin documentation
* https://lug.fh-swf.de/vim/vim-c/c-hotkeys.pdf

Resource
* https://github.com/tpope/vim-pathogen
