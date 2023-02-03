# Only works ubuntu or debian bases. Expect this to blow up in unexpected
# ways if not using some similar base
ARG BASE
FROM $BASE

USER root

# Install all the required packages
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
&& apt-get clean

RUN curl -sL https://github.com/sharkdp/fd/releases/download/v8.3.2/fd_8.3.2_amd64.deb -o fd.deb && dpkg -i fd.deb
RUN curl -sL https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb -o rg.deb && dpkg -i rg.deb
RUN curl -sL https://github.com/neovim/neovim/releases/download/v0.8.1/nvim.appimage -o /usr/local/bin/nvim
RUN chmod +x /usr/local/bin/nvim

ARG USER=devon
ARG ID=1000

RUN useradd -m $USER -u $ID
RUN usermod -a -G sudo $USER
RUN echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup Entrypoint
USER $USER
CMD ["bash"]
