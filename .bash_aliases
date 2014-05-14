alias e="vim"

# ls options are different on linux and mac
if [[ "`uname`" == "Linux" ]]; then
  alias l="pwd && ls -lah --color=auto"
else
  alias l="pwd && ls -lahG"
fi

alias tl="tail -n 250 -f"
alias sl="mdfind -onlyin ."

# git aliases
alias g="git"
alias ga="git add"
alias gau="git add -u"
alias gl="git log"
alias gd="git diff -w"
alias gdl="git diff HEAD^ -w"
alias gdf="git diff --name-only -w"
alias gdm="git diff master -w"
alias gdmf="git diff master --name-only -w"
alias gdh="git diff HEAD -w"
alias gdhf="git diff HEAD --name-only -w"
alias gb="git branch"
alias gs="git status"
alias gsu="git status -uno"
alias gc="git checkout"
alias gpr="git pull --rebase"
function grao() {
  git remote add origin git@github.com:smurthas/$@.git
}

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias pubkeycopy="cat ~/.ssh/id_rsa.pub | pbcopy"
alias ft="open facetime://"
alias m="mate"

# edit bash_aliases
alias resource="source ~/.bash_aliases"
alias aliases="vi ~/.bash_aliases; resource"

function mylocalip() {
  ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'
}

alias pbgist='node ~/dev/smurthas/gistpaste/index.js'

#list .js files
function ljs() {
  find . \( -name node_modules -prune \) -o \( -name Me -prune \) -o \( -name jquery-*.js -prune \) -o \( -name "*.js" \)
}

#find and grep in .js files
function fg() {
  find . \( -name node_modules -prune \) -o \( -name "Data.tests" -prune \) -o \( -name "Data" -prune \) -o \( -name Me -prune \) -o \( -name "Me.*" -prune \) -o \( -name tests -prune \) -o \( -name jquery-*.js -prune \) -o \( -name "*.min.js" -prune \) -o \( -name "lang-*.js" -prune \) -o \( -name "*.js" \) -exec grep -H -n "$@" {} \;
}

#find in all files
function ffnd() {
  find . \( -name node_modules -prune \) -o \( -name Me -prune \) -o \( -name "*.*" \) -exec grep -H -n "$@" {} \;
}

#pretty print json
function json() {
  python -c "import sys, json; print json.dumps(json.load(open(\"$1\")), sort_keys=True, indent=$2)"
}

#pretty print json
function jsonstr() {
  python -c "import sys, json; print json.dumps(json.loads(sys.stdin.readlines()[0]), sort_keys=True, indent=2)"
}

#pretty print json
function repstr() {
  python -c "import sys, json; print json.dumps(json.loads(sys.stdin.readlines()[0][:-1]))"
}

function ppcurl() {
  curl $@ | python -mjson.tool
}

alias sshtun="ssh -L 8042:localhost:8042 -N"

function jsed() {
  node ~/Dropbox/env/jsedit.js $@
}

function gaus() {
  git add -u $@ && git status
}

function ghcm () {
  curl -d "title=$1&description=$2&due_on=$3" https://api.singly.com/proxy/github/repos/singly/hallway/milestones?access_token=$GITHUB_TOKEN
}

function d () {
  node ~/Dropbox/env/date.js $1
}

function redis_server_start () {
  redis-server /usr/local/homebrew/etc/redis.conf > /dev/null &
}
function redis_server_stop () {
  pid=`ps | grep redis-server | grep -v grep  | awk '{print $1}'`
  kill $pid
}

function scratch () {
  vim /tmp/.scratch
}

function map () {
  URL="https://www.google.com/maps/preview#!q=$1"
  open $URL
}
