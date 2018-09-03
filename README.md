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

### YCM Configuration
If you are working with cmake or ROS (which really uses cmake under the hood), it is easiest to follow [Option 1](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion) in the YCM README. Basically, it boils down to putting

```
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
```

in your `CMakeLists.txt`

## i3 Window Manager
I use [i3wm](https://i3wm.org/) for my desktop environment. This is trickier to put in my dotfiles, since each computer needs to be changed slightly (especially for multi-monitor setups). I've opted for putting all my different configs into the `.config/i3/config`. Although the configuration will be installed in the correct place, it will need to be modified for the specific computer in use.

Some of the major changes I've made to the default i3wm configuration are

* Switching movement and resize from `j,k,l,;` to the classic vim movement keys `h,j,k,l`
* Using `Mod+q` to kill a window instead of `Mod+Shift+q`
* Replacing `dmenu_run` with `rofi`
* Changing splitting directions with `Mod+n` and `Mod+m`
* Named workspaces
* Changing window colors
* Adding i3lock with `Mod1+Mod2+l`
* "Natural Scrolling" on touchpads
* Changing caps lock to additional ctrl
* Adding a wallpaper with `feh`
* Adding brightness and audio controls through `xbacklight` and `pavucontrol`

I've had success removing the default desktop environment on Ubuntu 16.04 on some computers. However, on other computers, removing Gnome and gdb breaks the system. I may eventually get to the bottom of this ¯\\\_(ツ)\_/¯.
