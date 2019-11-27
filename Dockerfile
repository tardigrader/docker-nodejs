# Use centos8 base image
FROM    centos:centos8

LABEL   maintainer="Krister Löfgren <k@xyzzy.nu>"

ENV     LANG=C.UTF-8

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
# Install necessities
# Install Node.js, TypeScript and goodies
# Download Plug for Vim
RUN     dnf install -y epel-release && dnf update -y && \
        dnf install -y git vim jq tmux python36 cmake gcc-c++ make python36-devel \
        nodejs npm && \

        npm install -g yarn grunt eslint typescript tslint ts-node nodemon && \

        cd /root && \ 
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \

        dnf clean all

COPY    .vimrc /root

# Run this manually to automatically install all plugins
# Or just call :PlugInstall from within Vim.
COPY    INSTALL_VIM.sh /root

WORKDIR /root
