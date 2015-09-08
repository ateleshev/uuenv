# uuenv
[u]nix [u]ser [env]ironment

## Clone the project to home directory

```
git clone https://github.com/ArtemTeleshev/uuenv.git ~/.uuenv
```
## And execute

```
~/.uuenv/bin/configure
```

## Or configure environment manually

```
cd  ~
ln -s .nix-uenv/.vim
ln -s .nix-uenv/.vimrc
ln -s .nix-uenv/.screenrc
```

## Configure bash

```
echo "# include .bashrc from .nix-uenv" >> ~/.bashrc
echo "if [ -f ~/.nix-uenv/.bashrc ]; then" >> ~/.bashrc
echo "  . ~/.nix-uenv/.bashrc" >> ~/.bashrc
echo "fi" >> ~/.bashrc
```

## Configure git

```
git config --global user.name "<<Your name>>"
git config --global user.email "<<your.email.address@example.com>>"

echo "[include]" >> ~/.gitconfig
echo "  path = ~/.nix-uenv/.gitconfig" >> ~/.gitconfig
```

