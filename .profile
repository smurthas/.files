DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# secrets and local paths
if [ -f $HOME/.local ]
then
  source $HOME/.local
fi

# bashaliases
source $DIR/.bash_aliases

# pretty prompt
source $DIR/.prompt

# completion
source $DIR/.docker-completion
source $DIR/.git-completion

_compssh ()
{
cur=${COMP_WORDS[COMP_CWORD]};
COMPREPLY=($(compgen -W '$(/bin/cat ~/.ssh/config | grep "Host [a-zA-Z0-9]" | cut -c 6-) --all --schema' -- $cur))
}
complete -F _compssh ssh


export EDITOR=/usr/bin/vim

# node
export NODE_PATH=lib
