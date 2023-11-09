
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

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
#source /path-to-antidote/antidote.zsh




# .zshrc
# Lazy-load antidote and generate the static load file only when needed
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh


#initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
#antidote load



# If you come from bash you might have to change your $PATH.
export PATH=/var/lib/flatpak/exports/share:/home/parrot/.local/share/flatpak/exports/share:$HOME/bin:$PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
#'/var/lib/flatpak/exports/share'
#'/home/parrot/.local/share/flatpak/exports/share'

#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/snap/bin:$PATH
#export PATH=~/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export PATH=$PATH:~/home/parrot/.local/bin
MANROFFOPT="-c"

#export MANPAGER="sh -c 'col -bx | bat --theme=Dracula -l man -p'"
export MANPAGER="sh -c 'col -bx | bat --paging=always --theme=Dracula -l man --style=plain'"


export MANPATH="/usr/local/man:$MANPATH"
















[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

source $ZSH/oh-my-zsh.sh
#source ~/antigen.zsh



# now, simply add these two lines in your ~/.zshrc

# source antidote




#+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

#~ evalcache atuin init zsh
#eval "$(atuin init zsh)"

eval "$(dircolors -b)"
#~ _evalcache zoxide init zsh
eval "$(zoxide init zsh --cmd cd)"













setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e
#bindkey '^X' create_completion

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
















# ########################################################################################################################
# completion stuff
# ########################################################################################################################

autoload -Uz compinit
compinit




# basic file preview for ls (you can replace with something more sophisticated than head)
#zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
# set list-colors to enable filename colorizing
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'





# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"




# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false



# disable sort when completing options of any command
#zstyle ':completion:complete:*:options' sort false




# switch group using `,` and `.`

zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS


# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input


# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'



zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
  
  
# this is an example
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'batman $word'
#now, they can work, because (\\|*/|)man can match them.


# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'





# ########################################################################################################################







#alias grep=grep

for cmd in g++ gas head make ld ping6 tail traceroute6 $( ls /usr/share/grc/ ); do
  cmd="${cmd##*conf.}"
  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
done




# Save a lot of typing for common commands
alias gs="git status"
alias gc="git commit"
alias v="nvim"





# Overwrite existing commands for better defaults
alias mv='mv -i'           # -i prompts before overwrite
alias mkdir='mkdir -p'     # -p make parent dirs as needed
alias df='df -h'           # -h prints human readable format





alias ls='eza --icons --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group'
alias la='ls -a'
alias l='ls --grid'
alias ll='eza -lah --icons'
alias lt='ls --tree'


# Make shorthands for common flags
#alias ll="ls -lah"

# Save you from mistyping
alias sl=ls


alias sudo="sudo "



alias sherlock=/home/parrot/sherlock/sherlock/dist/sherlock/./sherlock


alias xfreerdp='flatpak run com.freerdp.FreeRDP'
alias cat="bat --paging=never --theme=Dracula"


alias -g -- --help="--help 2>&1 | bat --theme="OneHalfDark" --language=help -pp"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

