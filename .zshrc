
# Set up the prompt

autoload -Uz promptinit
promptinit
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


PROMPT='$(nice_exit_code) %n@%m > '



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -U PATH path

# OMZ does not add nested comp dirs to fpath so do it here, assume *src has completions


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/snap/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export PATH=$PATH:~/.local/bin

export MANPAGER="sh -c 'col -bx | bat --theme=Dracula -l man -p'"



export MANPATH="/usr/local/man:$MANPATH"













source ~/async.zsh
source $ZSH/oh-my-zsh.sh
source ~/antigen.zsh

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh





#+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
#~ _evalcache zoxide init zsh
eval "$(zoxide init zsh)"


#~ evalcache atuin init zsh
eval "$(atuin init zsh)"


setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey '^X' create_completion

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history





# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#antigen bundle MenkeTechnologies/zsh-more-completions
#bindkey '^I' fzf_completion
antigen bundle Aloxaf/fzf-tab



# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found



antigen bundle chrissicool/zsh-256color
antigen bundle le0me55i/zsh-extract

antigen bundle hlissner/zsh-autopair




# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle ael-code/zsh-colored-man-pages

antigen bundle bric3/nice-exit-code

antigen bundle oldratlee/hacker-quotes
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle atuinsh/atuin@main

antigen bundle jhwohlgemuth/zsh-pentest
antigen bundle zpm-zsh/mysql-colorize
antigen bundle mroth/evalcache


antigen bundle voronkovich/mysql.plugin.zsh
antigen bundle caarlos0/zsh-pg

antigen bundle jedahan/ripz
antigen bundle skx/sysadmin-util








#antigen bundle tom-doerr/zsh_codex


antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle qoomon/zsh-lazyload
antigen bundle jeffreytse/zsh-vi-mode




# Tell Antigen that you're done.
antigen apply











#antigen bundle dim-an/cod
autoload -Uz compinit
compinit
#source <(cod init $$ zsh)



zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'














for cmd in g++ gas head make ld ping6 tail traceroute6 $( ls /usr/share/grc/ ); do
  cmd="${cmd##*conf.}"
  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
done




# Save a lot of typing for common commands
alias gs="git status"
alias gc="git commit"
alias v="nvim"

alias grep=rg



# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format



alias ls="exa --icons --grid --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias la="ls -a"
alias ll='exa -lah --icons'

# Make shorthands for common flags
alias ll="ls -lah"

# Save you from mistyping
alias sl=ls


alias sudo="sudo "

#source ~/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# eval "$(atuin init zsh)"




#alias nmap="sudo grc nmap"

#alias man="grc man"

alias cat=bat




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

