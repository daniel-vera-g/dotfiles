FROM ubuntu:18.04

COPY . /root/dotfiles/

WORKDIR /root/dotfiles/

ENTRYPOINT [ "./INSTALL.sh" ]
