# Configuration Files for Linux systems

## Set Up Script
Basically, this  `setup.sh` is super cool, because it just does everything you need to set up the environment (ideally). It also makes a bare git repo with a worktree pointing to the home folder. To manage this, a function has been added to the `.zshrc` called `config`. Basically you just substitute `config` for `git` to manage your dotfiles. So you'd do something like `config status` instead of `git status`.

The following commands will **completely clobber** any configurations you have in your home folder, so either back up your dotfiles, or face the consequences.
```bash
wget https://raw.githubusercontent.com/DevonMorris/dotfiles/master/setup.sh
chmod +x setup.sh
./setup.sh
```

When you run `zsh` for the first time, the zplugin installation might kill all the files in `$HOME/.zinit`. This is easily fixed with a `config reset --hard`

## Zsh
We all know zsh is super powerful! For a long time, I was using [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) and rather blindly at that. I didn't realize that Oh My Zsh was really just a collection of preinstalled plugins packaged in one nice place. Recently, I moved to [zplugin](https://github.com/zdharma/zinit), due to its turbo mode for loading plugins. Honestly, once you get it configured right it's screaming fast. There are tons of good plugins, you can find them in my `zshrc`.

## Neovim
I personally use [Vim-Plug](https://github.com/junegunn/vim-plug) as my package manager in vim/neovim.

Some of my favorite packages are
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [CoC](https://github.com/neoclide/coc.nvim)
* [Vimtex](https://github.com/lervag/vimtex)
* [NerdCommenter](https://github.com/scrooloose/nerdcommenter)
* [Vim-Airline](https://github.com/vim-airline/vim-airline)
* [Ultisnips](https://github.com/SirVer/ultisnips)
* [Vim-gitgutter](https://github.com/airblade/vim-gitgutter)

If you are using cmake, you can easily export your compile commands to get
sweet sweet autocompletetion via CoC. To do this just put
```
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
```
in your top-level `CMakeLists.txt`

In CoC, you also have to select which linters you want to use. For C++, I recommend [coc-clangd](https://github.com/clangd/coc-clangd) :thumbsup:.

## i3 Window Manager
I use [i3wm](https://i3wm.org/) for my window manager.

It's basically a rice of suckless's dynamic window manager with some changes in
keybindings and some patches added.

To remove the default desktop environment I make an `~/.xinitrc` with the lines

```
#!/usr/bin/env bash
exec dbus-launch --exit-with-session i3wm
```

Then in `/etc/default/grub`, set `GRUB_CMDLINE_LINUX_DEFAULT="text"`and then run
```
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```
This obviously only works for distros with SystemD support.
Now, when the computer boots, log into tty and dwm will automatically start (This is due to a line in my `.zshrc`).

Sometimes when I'm feeling really fancy, I'll go for [i3-gaps](https://github.com/Airblader/i3).

## St
Check out my suckless terminal deus theme at [st-deus](https://github.com/DevonMorris/st-deus)

## Mirrors
You can find my dotfiles on [my website](https://git.devonmorris.dev), [github](https://github.com/DevonMorris/dotfiles) and [gitlab](https://gitlab.com/DevonMorris/dotfiles)
