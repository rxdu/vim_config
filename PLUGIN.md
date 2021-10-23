## Manage Vim Plugins with Pathogem

### Install Pathogen
```
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

add command to vimrc
```
execute pathogen#infect()
```

###  Install plugins as submodules
```
$ cd ~/.vim/bundle
$ git submodule add <git-repo-url>
$ git add .
$ git commit -m "plugin info"
```

Add "ignore = dirty" to the entry in .gitmodules. It should look like:
```
[submodule "bundle/fugitive"]
	path = bundle/fugitive
	url = git://github.com/tpope/vim-fugitive.git
	ignore = dirty
```

###  Upgrade a plugin 

Update a plugin

```
$ cd ~/.vim/bundle/<plugin-to-be-updated>
$ git pull origin master
```

or update all plugins

```
$ git submodule foreach git pull origin master
```

### Remove a plugin

* list existing plugins as git submodules

```
$ grep path .gitmodules | sed 's/.*= //'
```

* remove a plugin package 

```
$ git submodule deinit <package-path-and-name>
$ git rm <package-path-and-name>
$ rm -Rf .git/modules/<package-path-and-name>
$ git commit
```

### Reference:

* https://vi.stackexchange.com/questions/2089/what-are-the-differences-between-the-map-noremap-abbrev-and-noreabbrev-command