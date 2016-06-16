# vim_config

Configurations and plugins for Vim.

## 1. Commands

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
$ git submodule update --init
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

## Reference:

Configuration
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
* http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules

Resource
* https://github.com/tpope/vim-pathogen
