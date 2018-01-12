#--------------------------------------------------------------------------------#
# .bash_aliases
#--------------------------------------------------------------------------------#
# @author  | Artem
# @email   | artem.teleshev@gmail.com
# @site    | http://phpsw.net
# @version | 1.0.0
#--------------------------------------------------------------------------------#

alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -la'
alias h='history 50'
alias j='jobs -l'
alias cpr='cp -r'
alias df='df -H'
alias du='du -h'
alias dus='du -hs'
alias tf='tail -f'

# https://github.com/golang/dep
# go get -u github.com/golang/dep/cmd/dep
# sudo apt-get install graphviz
alias depshow='dep status -dot | dot -T png | display'

if [ ${UID} != 0 ]; then
  alias f='firefox'
  alias g='google-chrome'
fi

