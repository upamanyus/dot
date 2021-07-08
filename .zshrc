# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/upamanyu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=50000
setopt appendhistory autocd
unsetopt beep

# End of lines configured by zsh-newuser-install

autoload -U colors
colors
PROMPT="
%{$fg[green]%}%w %*
%{$fg[blue]%}%n %{$fg[yellow]%}at %{$fg[red]%}%m %{$fg[yellow]%}in %{$fg[magenta]%}%/
%{$fg[yellow]%}$%{$reset_color%} "
export PROMPT

#PROMPT="${(r:-$(tput cols)::-:)}\
#%{$reset_color%}
#%*
#%/
#$%{$reset_color%} "
#export PROMPT
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
EDITOR="vim"
export EDITOR

#
# LS_COLORS
#
LS_COLORS='di=4:ex=31:*.c=35'
export LS_COLORS

#
# Aliases
#
alias ls='ls --color -F'
alias l='ls --color -F'
alias ll='ls -l --color -F'
alias la='ls -la --color -F'

alias wifiwatch="watch -n 1 'ip a && ping -c 1 8.8.8.8'"
alias playmusic="mplayer http://ice1.somafm.com/seventies-128-mp3"
alias spymusic="mplayer http://ice4.somafm.com/secretagent-128-mp3"
#alias dafny="dafny /allowGlobals /noNLarith /autoTriggers:1 /z3opt:nlsat.randomize=false /warnShadowing /ironDafny"
alias cdfy="mono /home/upamanyu/research/formal_verification/civilized-dafny/Binaries/Armada.exe /armadaPath:/home/upamanyu/research/formal_verification/civilized-dafny"
alias cdfy="mono /home/upamanyu/research/formal_verification/civilized-dafny/Binaries/Armada.exe /armadaPath:../.."
alias cvfy="~/software/dafny/dafny /trace /compile:0 /arith:5"
alias ivfy="dafny /deprecation:0 /allowGlobals /noNLarith /autoTriggers:1 /z3opt:nlsat.randomize=false /warnShadowing /ironDafny /compile:0 /trace"
alias a2vfy="dafny /allowGlobals /autoTriggers:1 /z3opt:nlsat.randomize=false /warnShadowing /ironDafny /compile:0 /trace /arith:2"
alias a0vfy="dafny /allowGlobals /autoTriggers:1 /z3opt:nlsat.randomize=false /warnShadowing /ironDafny /compile:0 /trace /arith:0"

#
# Custom Scripts
#
export PATH=/home/upamanyu/software:/home/upamanyu/go/bin/:/home/upamanyu/.emacs.d/bin/:/usr/share/dotnet/:$PATH

#
# VIM!!!
#
bindkey -v
bindkey kj vi-cmd-mode

export KEYTIMEOUT=10
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg[yellow]%}[% NORMAL]%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/[% INSERT]%}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export WECHALLUSER="trivial"
export WECHALLTOKEN="68A99-B391E-2AC86-74DBA-E9C8A-E3805"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH="$HOME/go"

# THIS IS JUST TO GET GEPHI TO WORK...
# Don't know what this does, and don't care yet
export _JAVA_AWT_WM_NONREPARENTING=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opam configuration
test -r /home/upamanyu/.opam/opam-init/init.zsh && . /home/upamanyu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
