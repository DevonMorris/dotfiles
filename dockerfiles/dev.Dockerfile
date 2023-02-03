# Only works ubuntu or debian bases. Expect this to blow up in unexpected
# ways if not using some similar base
ARG BASE
FROM $BASE

USER root

# Install all the required packages
ARG APT_DEPS
RUN apt-get update \
 && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    fuse \
    gdb \
    git \
    htop \
    libfuse2 \
    software-properties-common \
    sudo \
    tree \
    wget \
    xclip \
    $APT_DEPS \
&& apt-get clean

RUN curl -sL https://github.com/sharkdp/fd/releases/download/v8.6.0/fd_8.6.0_amd64.deb -o fd.deb && dpkg -i fd.deb
RUN curl -sL https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb -o rg.deb && dpkg -i rg.deb
RUN curl -sL https://github.com/neovim/neovim/releases/download/v0.8.2/nvim.appimage -o /usr/local/bin/nvim
RUN chmod +x /usr/local/bin/nvim

CMD ["bash"]
