# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
#autoload -Uz compinit
#compinit
typeset -U PATH path

export ZSH_CACHE_DIR="$HOME/.cache"
# shellcheck disable=SC1072
autoload -Uz compinit
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-$HOME}/.zcompdump}

# cache .zcompdump for about a day
if [[ -n $(find "$ZSH_COMPDUMP" -mtime -1 2>/dev/null) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"
  touch "$ZSH_COMPDUMP"
fi

{
  #   compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &! 



export CLICOLOR=1
export BAT_THEME="Monokai Extended"

export SCCACHE_DIRECT=true


export RUST_BACKTRACE=full
export CARGO_INCREMENTAL=0
export RUSTC_WRAPPER=sccache

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache

#make ninja default for make
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"

export warhol_ignore_curl=1
export warhol_ignore_ls=1




#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote/functions $fpath)
autoload -Uz antidote


# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

export PATH="/usr/local/bin:$PATH"







alias cat="bat --paging=never"

alias curl="curlie"

alias man="batman"


alias top="btm --basic"



alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias mkdir="mkdir -p"

alias rmdir="rmdir -p"


last_repository=""

check_directory_for_new_repository() {
  current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ "$current_repository" ] &&
    [ "$current_repository" != "$last_repository" ]; then
    onefetch
  fi
  last_repository=$current_repository
}
cd() {
  z "$@"
  check_directory_for_new_repository
}

