
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi








FPATH="~/eza/completions/zsh:$FPATH"

autoload -Uz compinit
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP('#qNmh-20') ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi
{
  # compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &!



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes







#typeset -U PATH path





#export PATH="/snap/bin:$PATH"




#setopt histignorealldups sharehistory

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
#~ HISTSIZE=10000
#~ SAVEHIST=10000
#~ HISTFILE=~/.zsh_history




# If you come from bash you might have to change your $PATH.
#export PATH=/var/lib/flatpak/exports/share:/home/parrot/.local/share/flatpak/exports/share:$HOME/bin:$PATH







export MANPAGER='manpager --theme=\"Monokai Extended\" --style=plain | less --pattern=^\\S+'



#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8 
#export LANGUAGE="en_US:en"

export CLICOLOR=1
#export CLICOLOR_FORCE="yes"
#export LS_COLORS=di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43
#export ZSH_LS_BACKEND=exa



export ANTIDOTE_HOME="$HOME/.cache/antidote"
export ZSH_CACHE_DIR="$HOME/.cache/zshcache"
#export ZSH="$HOME/.oh-my-zsh"


export RUST_BACKTRACE=full

export CARGO_INCREMENTAL=0
export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt 
#export SCCACHE_LOG=debug

export RUSTC_WRAPPER=~/.cargo/bin/sccache
export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache


export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1



export LESS="$LESS -R"
export LESSOPEN='|~/.lessfilter %s'
export LESSCOLORIZER='bat'
export MANPAGER='manpager --style=plain | less --pattern=^\\S+'



export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"



export warhol_ignore_ls=1
export warhol_ignore_df=1
export warhol_ignore_diff=1
export warhol_ignore_du=1
export warhol_ignore_ps=1



#export LANG=en_US.UTF-8
















# optional, greet also when opening shell directly in repository directory
# adds time to startup

#~ macchina








#plugins=()

#source $ZSH/oh-my-zsh.sh




# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote


# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (antidote bundle <${zsh_plugins:r}.txt >|$zsh_plugins)
fi



source $zsh_plugins





zvm_after_init_commands+=(
'_evalcache atuin init zsh'
)


export ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"





autoload -Uz promptinit && promptinit && prompt powerlevel10k


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


####



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#~ # OMZ does not add nested comp dirs to fpath so do it here, assume *src has completions
#~ # .zshrc















































_evalcache dircolors

# eval "$(/home/parrot/.local/bin/mise activate zsh)"


eval "$(~/.local/bin/mise activate zsh)"

# ########################################################################################################################


# git repository greeter
last_repository=
check_directory_for_new_repository() {
	current_repository=$(git rev-parse --show-toplevel 2> /dev/null)

	if [ "$current_repository" ] && \
	   [ "$current_repository" != "$last_repository" ]; then
		onefetch
	fi
	last_repository=$current_repository
}
cd() {
	z "$@"
	check_directory_for_new_repository
}


#- [ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf


#~ [ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf


# ########################################################################################################################








#alias grep=grep

#for cmd in g++ gas head make ld ping6 tail traceroute6 $( ls /usr/share/grc/ ); do
# cmd="${cmd##*conf.}"
#  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
#done




# Save a lot of typing for common commands
#alias gs="git status"
# alias gc="git commit"
alias v="nvim"


# -------------------------------------replacements--------------------------#
alias aggregate="rs-aggregate"
alias cat="bat"
alias cloc="tokei"
alias curl="curlie"
#alias cp="xcp"
alias df="duf"
alias du="dust"
alias diff="delta"
alias find="fd"
alias grep="rga --no-encoding"
alias egrep="rga -F"
alias hexadump="hexyl"
alias ps="procs"
alias sed="sd"
alias timer="hyperfine"
alias top="btm"
alias uniq="huniq"
#alias cp="xcp -i"
# -------------------------------------commands--------------------------#



# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias mkdir="mkdir -p"


# Overwrite existing commands for better defaults
# alias mv='mv -i'           # -i prompts before overwrite
# alias mkdir='mkdir -p'     # -p make parent dirs as needed
# alias df='df -h'           # -h prints human readable format






# -------------------------------------utitlies--------------------------#

alias csvutil="qsv"
alias ch="cht.sh"
alias code="code-insiders"
alias dox="sn0int"
alias hp="http-prompt"
alias int="interpreter"
alias listalias="als"
alias lte="ls --tree"
alias lv="lnav"
alias sl="ls"
alias szrc="source ~/.zshrc"
alias wt="wezterm"
alias zplug="geany ~/.zsh_plugins.txt"
alias zpro="geany ~/.zprofile"
alias zrc="geany ~/.zshrc"






# Save you from mistyping


#~ alias sudo="sudo "



#~ alias g++='/usr/bin/grc --colour=auto g++'
#~ alias head='/usr/bin/grc --colour=auto head'
#~ alias make='/usr/bin/grc --colour=auto make'
#~ alias ld='/usr/bin/grc --colour=auto ld'
#~ alias ping6='/usr/bin/grc --colour=auto ping6'
#~ alias tail='/usr/bin/grc --colour=auto tail'
#~ alias traceroute6='/usr/bin/grc --colour=auto traceroute6'
#~ alias blkid='/usr/bin/grc --colour=auto blkid'
#~ alias df='/usr/bin/grc --colour=auto df'
#~ alias diff='/usr/bin/grc --colour=auto diff'
#~ alias dig='/usr/bin/grc --colour=auto dig'
#~ alias du='/usr/bin/grc --colour=auto du'
#~ alias env='/usr/bin/grc --colour=auto env'
#~ alias fdisk='/usr/bin/grc --colour=auto fdisk'
#~ alias findmnt='/usr/bin/grc --colour=auto findmnt'
#~ alias free='/usr/bin/grc --colour=auto free'
#~ alias gcc='/usr/bin/grc --colour=auto gcc'
#~ alias getfacl='/usr/bin/grc --colour=auto getfacl'
#~ alias getsebool='/usr/bin/grc --colour=auto getsebool'
#~ alias id='/usr/bin/grc --colour=auto id'
#~ alias ifconfig='/usr/bin/grc --colour=auto ifconfig'
#~ alias ip='/usr/bin/grc --colour=auto ip'
#~ alias iptables='/usr/bin/grc --colour=auto iptables'
#~ alias iwconfig='/usr/bin/grc --colour=auto iwconfig'
#~ alias jobs='/usr/bin/grc --colour=auto jobs'
#~ alias last='/usr/bin/grc --colour=auto last'
#~ alias lsattr='/usr/bin/grc --colour=auto lsattr'
#~ alias log='/usr/bin/grc --colour=auto log'
#~ alias lsblk='/usr/bin/grc --colour=auto lsblk'
#~ alias lsmod='/usr/bin/grc --colour=auto lsmod'
#~ alias lsof='/usr/bin/grc --colour=auto lsof'
#~ alias lspci='/usr/bin/grc --colour=auto lspci'
#~ alias mount='/usr/bin/grc --colour=auto mount'
#~ alias mvn='/usr/bin/grc --colour=auto mvn'
#~ alias netstat='/usr/bin/grc --colour=auto netstat'
#~ alias nmap='/usr/bin/grc --colour=auto nmap'
#~ alias php='/usr/bin/grc --colour=auto php'
#~ alias ping='/usr/bin/grc --colour=auto ping'
#~ alias ps='/usr/bin/grc --colour=auto ps'
#~ alias ss='/usr/bin/grc --colour=auto ss'
#~ alias stat='/usr/bin/grc --colour=auto stat'
#~ alias sysctl='/usr/bin/grc --colour=auto sysctl'
#~ alias systemctl='/usr/bin/grc --colour=auto systemctl'
#~ alias tcpdump='/usr/bin/grc --colour=auto tcpdump'
#~ alias traceroute='/usr/bin/grc --colour=auto traceroute'
#~ alias tune2fs='/usr/bin/grc --colour=auto tune2fs'
#~ alias tail='/usr/bin/grc --colour=auto tail'
#~ alias ulimit='/usr/bin/grc --colour=auto ulimit'
#~ alias uptime='/usr/bin/grc --colour=auto uptime'
#~ alias vmstat='/usr/bin/grc --colour=auto vmstat'
#~ alias whois='/usr/bin/grc --colour=auto whois'

#alias sherlock=/home/parrot/sherlock/sherlock/dist/sherlock/./sherlock


alias xfreerdp="flatpak run com.freerdp.FreeRDP"


#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat --style=plain ~/.mf; } || cat --style=plain ~/.mf



# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

#export PYENV_ROOT="$HOME/.pyenv"
#eval "$(pyenv init -)"










# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:
















#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

