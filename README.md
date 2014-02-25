# vim-setup

This is a pathogen based VIM setup to be cloned into your ~/.vim directory.

# Installation

* If the .vim directory already exists in your $HOME create a backup by renaming it.
* If the .vimrc file already exists in your $HOME create a backup by renaming it.

```
    $> cd ~
	$> git clone https://github.com/s6o/vim-setup.git .vim
	$> ln -s ~/.vim/.vimrc .vimrc
	$> cd .vim
	$> git submodule init
	$> git submodule update
```

