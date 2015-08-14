#--------------------------------------------------------------------------------#
# .bash_aliases
#--------------------------------------------------------------------------------#
# @author  | Artem
# @email   | artem.teleshev@gmail.com
# @site    | http://phpsw.net
# @version | 1.0.0
#--------------------------------------------------------------------------------#

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -la'
alias h='history 50'
alias j='jobs -l'
alias cpr='cp -r'
alias df='df -H'
alias du='du -h'
alias dus='du -hs'

if [ $UID != 0 ]; then
  alias f='firefox'
  alias g='google-chrome'
fi

