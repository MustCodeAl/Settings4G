# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
typeset -U PATH path

#export PATH="/sbin:$PATH" 
eval "$(homebrew/bin/brew shellenv)"
export PATH="/usr/sandbox/:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"

export PATH="/snap/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
