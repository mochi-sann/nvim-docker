FROM ubuntu:24.04

RUN apt update && \
    apt update && \
    apt install -y curl git ripgrep tar unzip vim wget locales;

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz;

WORKDIR /root

RUN nvim +:q

