FROM ubuntu:22


RUN apt update && \
    apt update && \
    apt install -y curl git ripgrep tar unzip vim wget;


RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage  && \ 
  chmod u+x nvim.appimage &&\
  ./nvim.appimage --appimage-extract &&\
  ./squashfs-root/AppRun --version && \
  mv squashfs-root  /  && \
  ln -s /squashfs-root/AppRun /usr/bin/nvim;



RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8;


RUN rm ~/.bashrc && \
    rm ~/.config/nvim/init.vim && \
    ln -s /dotfiles/.bashrc ~/.bashrc;


RUN nvim +:q

