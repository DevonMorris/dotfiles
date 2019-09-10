# Configuration Files for Linux systems

## Set Up Script
Basically, this  `setup.sh` is super cool, because it just does everything you need to set up the environment (ideally). It also makes a bare git repo with a worktree pointing to the home folder. To manage this, a function has been added to the `.zshrc` called `config`. Basically you just substitute `config` for `git` to manage your dotfiles. So you'd do something like `config status` instead of `git status`.

The following commands will **completely clobber** any configurations you have in your home folder, so either back up your dotfiles, or face the consequences.
```bash
wget https://raw.githubusercontent.com/DevonMorris/dotfiles/master/setup.sh                                                                                                                                              devon@WhiteTiger
chmod +x setup.sh
./setup.sh
```

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

In ALE, you also have to select which linters you want to use. For C++, I recommend [cquery](https://github.com/cquery-project/cquery), because they use cool words like highly-scalable and low-latency :thumbsup:.

## i3 Window Manager
I use [i3wm](https://i3wm.org/) for my desktop environment.

Some of the major changes I've made to the default i3wm configuration are

* Switching movement and resize from `j,k,l,;` to the _classic_ vim movement keys `h,j,k,l`
* Using `Mod+q` to kill a window instead of `Mod+Shift+q`
* Changing splitting directions with `Mod+i` and `Mod+o`
* Changing window colors
* Adding i3lock with `Mod1+Mod2+l`
* "Natural Scrolling" on touchpads
* Changing caps lock to additional ctrl (using `setxbmap`)
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
This obviously only works for distros with SystemD support.
Now, when the computer boots, log into tty and i3 will automatically start (This is due to a line in my `.zshrc`). 
