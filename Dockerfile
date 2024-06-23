FROM ubuntu:24.04

RUN apt update && \
    apt update && \
    apt install -y curl git ripgrep tar unzip vim wget;


ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"
RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8;


# RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage  && \ 
#   chmod u+x nvim.appimage 
# RUN ./nvim.appimage --appimage-extract 
# RUN  ./squashfs-root/AppRun --version && \
#   mv squashfs-root  /  && \
#   ln -s /squashfs-root/AppRun /usr/bin/nvim;

RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz;


WORKDIR /root




RUN nvim +:q

