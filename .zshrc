
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

setopt COMBINING_CHARS
HISTSIZE=100000

# ########################################################################################################################
# environment variables
# ########################################################################################################################

# remove duplicat entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path











#---------------------------------------exports-----------------------------------------------#

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1

export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt
export SCCACHE_DIRECT=true


export RUST_BACKTRACE=full
export CARGO_INCREMENTAL=0
export RUSTC_WRAPPER=sccache

export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache

#make ninja default for make
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=1

export LDFLAGS="-fuse-ld=mold" # add to your .profile

# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"


#------------------------------------plugin exports-------------------------------------#

export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="\#*"
export ZSH_LS_BACKEND=eza

export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN="|~/.lessfilter %s"
export LESSCOLORIZER="bat"
export MANPAGER="manpager | less --pattern=^\\S+"

export WARP_ENABLE_WAYLAND=1
export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
export BROWSER=google-chrome

export warhol_ignore_curl=1
export warhol_ignore_du=1
export warhol_ignore_df=1
export warhol_ignore_diff=1
export warhol_ignore_ls=1
export warhol_ignore_ps=1

export MISE_PYTHON_COMPILE=true

# ########################################################################################################################

# ########################################################################################################################
# sourcing and plugins
# ########################################################################################################################

### ANTIDOTE PLUGIN LOADING

# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote.
fpath=(${ZDOTDIR:-~}/.antidote/functions $fpath)
autoload -Uz antidote

export ZSH="$(antidote path ohmyzsh/ohmyzsh)"

export PATH="/snap/bin:$HOME/.local/bin:$PATH"

# make a completions folder at this location too
export ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

####


# Append a command directly
zvm_after_init_commands+=(
  'eval "$(atuin init zsh)"'
)

autoload -Uz async && async

# appearance
autoload -Uz promptinit && promptinit && prompt powerlevel10k



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ########################################################################################################################

# ########################################################################################################################
# binds
# ########################################################################################################################

# ########################################################################################################################

# #############################################[ Evals ]###########################################################
# eval "$(/home/bolt/.local/bin/mise activate zsh)"

# ########################################################################################################################
# -------aliases---------
# ########################################################################################################################

# -------------------------------------replacements--------------------------#
alias aggregate="rs-aggregate"
alias cat="bat"
alias catn="bat --style=auto"
alias cloc="tokei"
alias curl="curlie"
alias df="duf"
alias du="dust"
alias diff="batdiff"
alias find="bfs"
alias grep="rga --color=auto"
alias egrep="rga -F"
alias hexadump="hexyl"
alias ps="procs"
alias timer="hyperfine"
alias top="btm --basic"
alias asdf="mise"

# -------------------------------------commands--------------------------#

# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"

alias rm="rm -i"

alias rf="rm -frd"

alias mkdir="mkdir -p"

alias rmdir="rmdir -p"

alias sudo="sudo "

# -------------------------------------utitlies--------------------------#

alias csvutil="qsv"
alias ch="cht.sh"
alias code="code-insiders"
alias dedupe="fclones group --cache . | fclones remove --priority newest"
alias dups="fclones group . | fclones remove --priority newest --dry-run 2>/dev/null"
alias dox="sn0int"
alias hp="http-prompt"
alias hgrep="fc -El 0 | rg"
alias int="interpreter"
alias listalias="als"
alias ltd="tldr -p linux"
alias lv="lnav"
alias sl="ls"
alias szrc="exec zsh" # better then sourcezing
alias wt="wezterm"
alias zplug="nano ~/.zsh_plugins.txt"
alias zpro="nano ~/.zprofile"
alias zrc="nano ~/.zshrc"

# ##########################################[Lazy Loading scripts ]###############################################################

# git repository greeter aka onefetch
#
#


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

lcd() {
  cd "$1" && la
}
mcd() {
  mkdir -p -- "$1" &&
    z "$1"
}
update_mf() {
  local mf_file="$1"
  local prev_time_file="$2"
  local time_format="$3"

  # Check if the previous time exists and is different from the current time
  if [ "$(date +"$time_format")" != "$(cat "$prev_time_file" 2>/dev/null)" ]; then
    macchina >"$mf_file"
    date +"$time_format" >"$prev_time_file"
  fi

  # Output the contents of the file
  cat "$mf_file"
}
update_mf "$HOME"/.mf "$HOME"/.mf.prevweek "%U"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.




# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"



