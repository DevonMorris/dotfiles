### all hail the one true editor
export EDITOR='nvim'

# Man pages + neovim = <3
export MANPAGER='nvim +Man!'

# Add relevant directories to path
export PATH=$HOME/.local/bin:$PATH
export PATH=/snap/bin:$PATH

# Add ccache support automatically if installed
if which ccache > /dev/null 2>&1; then
  export CC="ccache gcc"
  export CXX="ccache g++"
fi
