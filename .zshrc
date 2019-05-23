#!/bin/zsh
export PATH=$PATH:/usr/local/bin
export PATH="$PATH:$(brew --prefix)/bin"
export SHELL="${SHELL-/bin/zsh}"
export OS="${OS-$(uname)}"

fpath+=("/usr/local/share/zsh/site-functions")

if [ "$OS" = 'Linux' ]; then
  fpath+=("$HOME/.local/share/zsh/site-functions")
fi
if [ "$OS" = 'Darwin' ]; then
  fpath+=("$HOME/.zsh/completions")
fi

if [ ! -d "$HOME/.zgen" ]; then
  mkdir -p "$HOME/.zgen"
  git clone https://github.com/tarjoilija/zgen "$HOME/.zgen"
fi

. "$HOME/.zgen/zgen.zsh"
if ! zgen saved; then
  echo "Creating zgen init"
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlighting
  # alias tips
  # zgen load djui/alias-tips
  zgen load zsh-users/zsh-completions src
  zgen oh-my-zsh plugins/git
  zgen load voronkovich/gitignore.plugin.zsh

  # pip completion
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/pip

  # Go command completion
  zgen oh-my-zsh plugins/golang

  # Kubernetes context
  zgen oh-my-zsh plugins/kube-ps1

  # cp completion
  zgen oh-my-zsh plugins/cp

  # extraction helpers
  zgen oh-my-zsh plugins/extract

  # fish like history search
  zgen load zsh-users/zsh-history-substring-search

  zgen load romkatv/powerlevel10k powerlevel9k
  zgen save
fi

setopt nocorrectall

[ -f "$HOME/.fonts/devicons-regular.sh" ] && . "$HOME/.fonts/devicons-regular.sh" 
[ -f "$HOME/.fonts/fontawesome-regular.sh" ] && . "$HOME/.fonts/fontawesome-regular.sh" 
[ -f "$HOME/.fonts/octicons-regular.sh" ] && . "$HOME/.fonts/octicons-regular.sh" 
[ -f "$HOME/.fonts/pomicons-regular.sh" ] && . "$HOME/.fonts/pomicons-regular.sh" 

COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root)
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_KUBE_PS1='kube_ps1'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv custom_kube_ps1 vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status)

# Customize to your needs...
export LANG="en_US.utf-8"
export JAVA_OPTS="-Dfile.encoding=UTF-8"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export CLICOLOR=1

export PATH="$HOME/bin:${${GOPATH-$HOME/go}//://bin:}/bin:$GOROOT/bin:$HOME/.rbenv/bin:$PATH"

source ~/.aliases
source ~/.extra
alias reload="source ~/.zshrc"

if [ $commands[hub] ]; then
  eval "$(hub alias -s)"
fi

if [ $commands[rbenv] ]; then
  eval "$(rbenv init -)"
fi
if [ $commands[direnv] ]; then
  source <(direnv hook zsh)
fi
if [ $commands[minikube] ]; then
  source <(minikube completion zsh)
fi
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
if [ $commands[skaffold] ]; then
  source <(skaffold completion zsh)
fi
if [ $commands[helm] ]; then
  source <(helm completion zsh | sed -e "s/aliashash\\[\"\\(${LWORD}.*${RWORD}\\)\"\\]/aliashash[\\1]/g")
fi
if [ $commands[kops] ]; then
  source <(kops completion zsh)
fi
if [ $commands[richgo] ]; then
  alias go=richgo
fi

[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
