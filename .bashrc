# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
#!/usr/bin/env bash



export MANPAGER='manpager --style=plain | less --pattern=^\\S+'
export CLICOLOR=1
export LESS="$LESS -R"
export LESSOPEN='|~/.lessfilter %s'
export LESSCOLORIZER='bat'

export PYTHONDEBUG=1
export BETTER_EXCEPTIONS=1

export RUST_BACKTRACE=full

export CARGO_INCREMENTAL=0
export SCCACHE_ERROR_LOG=/tmp/sccache_log.txt 

export RUSTC_WRAPPER=~/.cargo/bin/sccache
export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache







export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"






# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/parrot/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME=''

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh




ble-face auto_complete='fg=gray'
bleopt complete_ambiguous=


bleopt prompt_ps1_transient=always:trim

eval "$(starship init bash)"
eval "$(atuin init bash)"
eval "$(mise activate bash)"






alias bashconfig="geany ~/.bashrc"



# Overwrite existing commands for better defaults
alias cp="cp -i"

alias mv="mv -i"
alias rm="rm -i"

alias mkdir="mkdir -p"




alias csvutil="qsv"
alias ch="cht.sh"
#alias code="code-insiders"
alias dox="sn0int"
alias hp="http-prompt"
alias int="interpreter"
alias listalias="als"
alias lte="eza --tree"
alias ltd="tldr -p linux"
alias lv="lnav"
alias sl="ls"



#macchina
[ "$(date +%j)" != "$(cat ~/.mf.prevtime 2>/dev/null)" ] && { macchina > ~/.mf; date +%j > ~/.mf.prevtime; cat ~/.mf; } || cat ~/.mf

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



# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
