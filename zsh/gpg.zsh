# --- GPG agent initialization
# # setup gpg (this is the old way)
# if [[ "x$(which gpg2)" != "x" ]] ; then
#   export GPG_TTY=$(tty) 
#   eval $(gpg-agent --daemon) 
# fi

# the following is a better way from Oh-my-zsh
local GPG_ENV=$HOME/.gnupg/gpg-agent.env

function start_agent {
  # compared to OMZ, I removed ssh enabling ... it didn't work well with OSX default ssh
  /usr/bin/env gpg-agent --daemon --write-env-file ${GPG_ENV} > /dev/null
  chmod 600 ${GPG_ENV}
  . ${GPG_ENV} > /dev/null
}

# Source GPG agent settings, if applicable
if [ -f "${GPG_ENV}" ]; then
  . ${GPG_ENV} > /dev/null
  # ps -ef | grep ${SSH_AGENT_PID} | grep gpg-agent > /dev/null || {
  ps -ef  | grep gpg-agent > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID

export GPG_TTY=$(tty)
