# Configuration Files for \*nix systems

## Configure.sh Script

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

### New YCM Configuration
If you are working with cmake or ROS (which really uses cmake under the hood), it is easiest to follow [Option 1](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion) in the YCM README. Basically, it boils down to putting

```
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
```

in your `CMakeLists.txt`

### Old YCM Configuration 
This is the old way I used to use YouCompleteMe. It still may be helpful for some so I'll leave it in the README.

I have two different YouCompleteMe configuration files. The one in `.vim/.ycm_extra_conf.py` helps with cmake stuff (Borrowed from [Bastian Rieck](http://bastian.rieck.ru/blog/posts/2015/ycm_cmake/)). The YouCompleteMe file `./.ycm_extra_conf.py` helps with completetion associated with [ROS](http://www.ros.org/). It requires you to set the `$ROS_WORKSPACE` environment variable. This can be done by going to your catkin workspace and running `export ROS_WORKSPACE=$(pwd)`. Note: this needs to be copied to your catkin workspace to work.

## i3 Window Manager
