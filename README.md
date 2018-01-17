# Configuration Files for \*nix systems

## Vim
I personally use [Vundle](https://github.com/VundleVim/Vundle.vim) as my package manager in vim.

Some of my favorite packages are

* [Vim-Fugitive](https://github.com/tpope/vim-fugitive)
* [Vimtex](https://github.com/lervag/vimtex)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [Vim-Airline](https://github.com/vim-airline/vim-airline)
* [Ultisnips](https://github.com/SirVer/ultisnips)
* [Vim-gitgutter](https://github.com/airblade/vim-gitgutter)

I have two different YouCompleteMe configuration files. The one in `.vim/.ycm_extra_conf.py` helps with cmake stuff (Borrowed from [Bastian Rieck](http://bastian.rieck.ru/blog/posts/2015/ycm_cmake/)). The YouCompleteMe file `./.ycm_extra_conf.py` helps with completetion associated with [ROS](http://www.ros.org/). It requires you to set the `$ROS_WORKSPACE` environment variable. This can be done by going to your catkin workspace and running `export ROS_WORKSPACE=$(pwd)`.
