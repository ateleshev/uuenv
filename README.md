# rpi-uenv
Raspberry Pi user environment

## Clone the project to home directory

```
git clone https://github.com/ArtemTeleshev/rpi-uenv.git ~/.rpi-uenv
```

## Configure environment

```
cd  ~
ln -s .rpi-uenv/.vim
ln -s .rpi-uenv/.vimrc
ln -s .rpi-uenv/.screenrc
```

## Configure bash

```
echo "# include .bashrc from .rpi-uenv" >> ~/.bashrc
echo "if [ -f ~/.rpi-uenv/.bashrc ]; then" >> ~/.bashrc
echo "  . ~/.rpi-uenv/.bashrc" >> ~/.bashrc
echo "fi" >> ~/.bashrc
```

## Configure git

```
git config --global user.name "<<Your name>>"
git config --global user.email "<<your.email.address@example.com>>"

echo "[include]" >> ~/.gitconfig
echo "  path = ~/.rpi-uenv/.gitconfig" >> ~/.gitconfig
```

