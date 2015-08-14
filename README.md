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
ln -s .rpi-uenv/.bash_aliases
```

## Configure bash

```
echo -e "\nif [ -f ~/.rpi-uenv/.bashrc ]; then\n  . ~/.rpi-uenv/.bashrc\nfi\n" >> ~/.bashrc
```

## Configure git

```
git config --global user.name "<<Your name>>"
git config --global user.email "<<your.email.address@example.com>>"

echo -e "\n[include]\n  path = ~/.rpi-uenv/.gitconfig\n" >> ~/.gitconfig
```

