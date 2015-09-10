# uuenv
[u]nix [u]ser [env]ironment

## Reconfigure locales

```
sudo dpkg-reconfigure locales
  en_US.UTF-8 ... done
  ru_RU.UTF-8 ... done
  ru_UA.UTF-8 ... done
  uk_UA.UTF-8 ... done
```

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
ln -s .uuenv/.vim
ln -s .uuenv/.vimrc
ln -s .uuenv/.screenrc
```

## Configure bash

```
echo "# include .bashrc from .uuenv" >> ~/.bashrc
echo "if [ -f ~/.uuenv/.bashrc ]; then" >> ~/.bashrc
echo "  . ~/.uuenv/.bashrc" >> ~/.bashrc
echo "fi" >> ~/.bashrc
```

## Configure git

```
git config --global user.name "<<Your name>>"
git config --global user.email "<<your.email.address@example.com>>"

echo "[include]" >> ~/.gitconfig
echo "  path = ~/.uuenv/.gitconfig" >> ~/.gitconfig
```

