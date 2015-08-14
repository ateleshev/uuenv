#--------------------------------------------------------------------------------#
# .bashrc
#--------------------------------------------------------------------------------#
# @author  | Artem
# @email   | artem.teleshev@gmail.com
# @site    | http://phpsw.net
# @version | 1.0.0
#--------------------------------------------------------------------------------#

export LD_LIBRARY_PATH="$UL_LIB_HOME"

# PS1
# \w - full path to current directory
# \W - current directory
# \u - user name
# \h - host name
# \A - time in format H:i (23:59)
if [ $UID == 0 ] ; then
  export PS1="\[\033[01;44m\] \A \[\033[00m\] [\u@\h] \[\033[01;36m\]\w\[\033[00m\] # "
else
  export PS1="\[\033[01;44m\] \A \[\033[00m\] [\u@\h] \[\033[01;36m\]\W\[\033[00m\] > "
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# GO lang

#export GOROOT=$UL_LIB_HOME/go
# set PATH so it includes GO bin if it exists
#if [ -d "$GOROOT/bin" ] ; then
#  PATH=$GOROOT/bin:$PATH
#fi

if [ -d "$HOME/go" ] ; then
  export GOPATH=$HOME/go

  if [ -d "$GOPATH/bin" ] ; then
    export GOBIN=$GOPATH/bin
    PATH="$GOBIN:$PATH"
  fi
fi

PATH="./bin:$PATH"
export PATH

#XDebug
#export XDEBUG_CONFIG="idekey=xdebug"

