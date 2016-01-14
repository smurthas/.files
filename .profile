export NVM_DIR="/Users/smurthas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# secrets and local paths
if [ -f $HOME/.private ]
then
  source $HOME/.private
fi

# bashaliases
source $DIR/.bash_aliases

# pretty prompt
source $DIR/.prompt

# completion
which docker > /dev/null 2>/dev/null && source $DIR/.docker-completion
source $DIR/.git-completion

# npm completion
. <(npm completion)

_compssh ()
{
cur=${COMP_WORDS[COMP_CWORD]};
COMPREPLY=($(compgen -W '$(/bin/cat ~/.ssh/config | grep "Host [a-zA-Z0-9]" | cut -c 6-) --all --schema' -- $cur))
}
complete -F _compssh ssh

_compacs_withlist () {
  acs list --no-colors | grep "App name: " | cut -c 11-
}

_compacs () {
  first=${COMP_WORDS[1]};
  cur=${COMP_WORDS[COMP_CWORD]};
  #echo $cur
  case $first in
    cname|list|logcat|loglist|accesslog|usage|crt|unpublish|remove|config|download)
      COMPREPLY=($(compgen -W '$(_compacs_withlist) --dir -d -n --no-colors --no-banner --dates' -- $cur))
      return 0
      ;;
  esac

  COMPREPLY=($(compgen -W 'new add cname list logcat loglist accesslog usagecrt login logout publish run unpublish remove config whoami download' -- $cur))
  return 0
}
complete -F _compacs acs


export EDITOR=/usr/bin/vim

# node
export NODE_PATH=lib

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# psemoji prompt modification 🚲
#source /Users/Simon/.🚲/🚲
#export PS1=$PSE_STANDARD$(date +"%T")\[\033[0m\] \e]2;\a$(parse_git_branch_and_add_brackets)\[\033[0m\]\n∂:

