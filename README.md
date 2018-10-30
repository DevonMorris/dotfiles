# Configuration Files for Linux systems

## Configure.sh Script
Ideally, you should just run this script and your computer will be customized exactly like mine. Basically, this file forcibly symlinks the config files in this repo to your home folder. If you don't want to lose your old config, you should back up your files before running `./configure.sh`. For i3wm additional tweaking will probably be necessary due to monitor resolutions, keyboard layouts and media controls.

## Vim
I personally use [Vim-Plug](https://github.com/junegunn/vim-plug) as my package manager in vim.

Some of my favorite packages are

* [Vim-Fugitive](https://github.com/tpope/vim-fugitive)
* [Vimtex](https://github.com/lervag/vimtex)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
* [ALE](https://github.com/w0rp/ale)
* [Vim-Airline](https://github.com/vim-airline/vim-airline)
* [Ultisnips](https://github.com/SirVer/ultisnips)
* [Vim-gitgutter](https://github.com/airblade/vim-gitgutter)

### ALE Configuration
To work with ALE in C++ you have to export your `compile_commands.json. This is done by putting
```
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
```

in your `CMakeLists.txt`. If you're feeling really really adventurous for ROS you can put this line in your top-level cmake file `/opt/ros/kinetic/share/catkin/cmake/toplevel.cmake`. That way all future ROS projects will export their compile commands for YCM to use.

In ALE, you also  have to select which linters you want to use. For C++, I'm currently using the Clang stack. The linters work pretty well with exception of header files. There is this [issue](https://github.com/w0rp/ale/issues/782) explaining the nuances of why it doesn't work and some rather hacky fixes.

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

To remove the default desktop environment I make an `~/.xinitrc` with the lines

```
#!/usr/bin/env bash
exec dbus-launch --exit-with-session i3
```

Then in `/etc/default/grub`, set `GRUB_CMDLINE_LINUX_DEFAULT="text"`and then run
```
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```
Now, when the computer boots, log into tty and i3 will automatically start (This is due to a line in my `.zshrc`).

