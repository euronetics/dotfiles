# Use home local bin if it exists
if [[ -d "$HOME/local/bin" ]]
then
  PATH=$HOME/local/bin:$PATH
fi

if [[ -d "${HOME}/.rbenv" ]]
then
  PATH="${HOME}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi

PATH=$PATH:/sbin

export PATH

# Load zsh modules
autoload -U zargs
autoload zcalc

# Load my functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Watch all user except me
watch=notme
LOGCHECK=0

# Prompts
PS1=$'%{\e[0;37m%}%B%*%b %{\e[0;35m%}%m:%{\e[0;37m%}%~ %(!.#.>) %{\e[00m%}'

# Language
UTF8=en_US.UTF-8
export LANG=$UTF8
export LC_ALL=$UTF8
export LC_LANG=$UTF8
export LC_CTYPE=$UTF8
export LANGUAGE=$UTF8

# Use vim as editor if it exists
if [[ -x $(which vim) ]]
then
  export EDITOR="vim"
  export USE_EDITOR=$EDITOR
  export VISUAL=$EDITOR
fi

# History file settings
export HISTIGNORE="&:ls:[bf]g:reset:clear:cd:cd .."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Report time of command if it took longer than 30 seconds
export REPORTTIME=30

# Promts for confirmation after 'rm *'
setopt RM_STAR_WAIT

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]
then
  if [[ -x `which dircolors` ]]
  then
    eval `dircolors -b`
    alias 'ls=ls --color=auto'
  fi
fi

export CLICOLOR=1
