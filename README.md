# Configuration Files for Linux systems

![setup](assets/setup.png)

## Set Up Script
Basically, `init_dotfiles.sh` is super cool, because it just does
everything you need to set up the environment (ideally). It also makes a bare
git repo with a worktree pointing to the home folder. To manage this, a
script has been added to provide the command `dots`. Basically you just
substitute `dots` for `git` to manage your dotfiles. So you'd do something like
`dots status` instead of `git status`.

The following command will install the dotfiles and create a backup of any
conflicting files as needed.
```bash
curl -s https://raw.githubusercontent.com/DevonMorris/dotfiles/master/scripts/init_dotfiles.sh | bash
```

## Bash
I have switched back to bash from zsh. I wanted to get more familiar with bash
scripting and have basically been able to replicate most of the things I enjoy
in zsh in bash. Check out my `.bashrc` and `.shell.d` folder for bash config.

## Neovim
I personally use [Packer](https://github.com/wbthomason/packer.nvim) as my package manager in vim/neovim.

If you are using cmake, you can easily export your compile commands to get
sweet sweet autocompletetion via clangd and Neovim's LSP client. To do this just put
```
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
```
in your top-level `CMakeLists.txt`. Check out the `.config/nvim/lua/config/lsp.lua` for configuring lsp in neovim (it's super easy).

## Awesome Window Manager
I use [awesome](https://awesomewm.org/) for my window manager. Check out the my `~/.config/awesome/rc.lua`.

To remove the default desktop environment I make an `~/.xinitrc` with the lines

```
#!/usr/bin/env bash
exec dbus-launch --exit-with-session awesome
```

Then in `/etc/default/grub`, set `GRUB_CMDLINE_LINUX_DEFAULT="text"`and then run
```
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```
This obviously only works for distros with SystemD support.
Now, when the computer boots, log into tty and awesome will automatically start (This is due to a line in my `.zshrc`).

## St
Check out my suckless terminal deus theme at [st-deus](https://github.com/DevonMorris/st-deus)

## Mirrors
You can find my dotfiles on [my website](https://git.devonmorris.dev/dotfiles), [github](https://github.com/DevonMorris/dotfiles) and [gitlab](https://gitlab.com/DevonMorris/dotfiles)
