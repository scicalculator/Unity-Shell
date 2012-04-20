#!/bin/bash
#
# This file establishes the system aliases
#

### Universal aliases {{{1
alias vim='tmvim'
alias vi='tmvim'
alias v='tmvim'

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# making lists
alias ls='ls --color=auto'
alias la="ls --color=auto -Gla"
alias lsd='ls -l | grep "^d"'
alias lsl='ls --color=auto -l'

# move to local folders
# alias mdcode='cd $MD_CODE'
# alias mdsims='cd $MD_SIMS'
# alias mdkesshou='cd $MD_CG'
# alias mdbin='cd $MD_BIN'
# alias mdinput='cd $MD_INPUT'
# alias bfiles='cd $SVN_BASH'

#  setup easy to use variabls
alias rmi='rm -i '
alias cpi='cp -i '
alias grepi='grep -i '
alias tarzip='tar -cvzf '
alias untarzip='tar -xvzf '
alias fileSize='du -h '

if [[ $(which hili 2> /dev/null) ]] ; then 
  alias make="hili make"
  if [[ $COMP_TYPE == remote ]] ; then
    alias config="hili ./configure --prefix=$HOME/local)"
  fi
fi

# handy command to detach tmux but keep the shell running (kind-of)
if [[ -n $TMUX ]] ; then
  alias detach="tmux detach" 
fi

if [[ -n ipython ]] ; then
  alias ipyc="ipython console"
  alias ipy="ipython "
else
  alias ipy="python"
fi

# pizza py
alias pizza="python ~/dev/py-pizza/src/pizza.py"

# remap mutt to tmuxified mutt
alias mutt=tmmutt
# syntax highlighter cat
alias pcat="pygmentize -g"
function pless() {
pygmentize -g "$@" | less -R
}
# # re-alias the less pager
# alias less="$PAGER"
# alias zless="$PAGER"
### System specific aliases {{{1
if [[ "$COMP_TYPE" == "local" ]] ; then
  # local-computer bin
  alias binge='cd $BIN_GE'

  # proxy server connection for getting articles
  alias proxyssh='tssh -P'

  # system functions
  # these reference shell scripts that I have created
  alias battInfo='pmset -g'
  alias suwifi='sudo tempwifi'

  # calendar stuff
  alias gcalw='gcalcli calw'  
  alias gcalm='gcalcli calm'
  alias gcala='gcalcli --details agenda'
  alias gcaladd='google calendar add '

  # Other
  #alias simsummary='open http://dl.dropbox.com/u/7645999/mdLogs/index.html'
  alias matlab='/Applications/MATLAB_SV74/bin/matlab -nojvm -nosplash -nodesktop'
  alias octave='hili octave -q'
  alias dterm='open /Applications/DTerm.app'
  alias t='todotxt'
  alias tree='tree -C'
  alias tmo='tmoct'
  alias tmv='tmvim'
  if [[ ${HOSTNAME%.*} == k* ]] ; then
    alias ircw="tmux new-window -n 'irssi' 'irc'"
  else
    alias ircw="tssh k -t 'irc'"
  fi

  # maybe useful for git
  alias undopush="git push -f origin HEAD^:master"

  # for the lolz (I got these from some other github directory, but their great)
  alias stfu="osascript -e 'set volume output muted true'"
  alias pumpitup="osascript -e 'set volume 10'"
  alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF IS GOING ON\?\!'"

  ### Remote server aliases {{{1
elif [[ "$COMP_TYPE" == "central" ]] || [[ "$COMP_TYPE" == "remote" ]] ; then
  #### linux
  # PBS statistics
  alias qme='qstat -u $USER'

fi

