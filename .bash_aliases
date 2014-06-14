alias e="vim"

# ls options are different on linux and mac
if [[ "`uname`" == "Linux" ]]; then
  alias l="pwd && ls -lah --color=auto"
else
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
  alias l="pwd && ls -lahGp"
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
alias gitjk="history 10 | tail -r | gitjk_cmd"

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

alias npml="npm --registry http://localhost:5984"

alias cov="open coverage/lcov-report/index.html"



# AppC Single Image
function node-acs-update() {
  ssh-add
  ssh -A vagrantd "sudo sed -i.bak 's/https:\/\/github.com\//git@github.com:/g' /opt/appcelerator/code/acs-base-deployment/utilities/update-code/update_appcimage.sh && sudo /opt/appcelerator/code/acs-base-deployment/utilities/update-code/update_appcimage.sh -p node-acs -gc"
}

alias node-acs-log-nettle="ssh vagrantd 'tail -f -n 100 /log/node-acs-nettle-server/local-nettle-server.log'"
alias node-acs-log-stratus="ssh vagrantd 'tail -f -n 100 /log/node-acs-stratus/stratus.log'"

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

function idonethis () {
  done_date=`date "+%Y-%m-%d"`
  session_id=$IDONETHIS_SESSION_ID
  csrf_token=$IDONETHIS_CSRF_TOKEN
  email=$IDONETHIS_EMAIL
  cal=$IDONETHIS_CALENDAR
  done=`printf '%s ' "$@" | sed 's/ *$//'`
  data="{\"done_date\":\"$done_date\",\"text\":\"$done\"}"

  cookie="Cookie: sessionid=$session_id; csrftoken=$csrf_token;"
  curl -sS -X POST "https://idonethis.com/api/v3/team/$cal/dones/" \
      -H "$cookie" \
      -H "Content-Type: application/json" \
      -H "Referer:https://idonethis.com/cal/$cal/" \
      -H "Host:idonethis.com" \
      -H "Origin:https://idonethis.com" \
      -H "X-CSRFToken:$csrf_token" \
      -d "$data" | jsonstr | grep "  \"text\": " | cut -c 11-
}


#function jurl () {
#  curl $@ | prettyjson
#}
