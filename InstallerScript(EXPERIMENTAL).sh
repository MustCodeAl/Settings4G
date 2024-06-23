#!/bin/bash

# Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install -y \
    build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    curl git libncurses-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    autopoint gettext groff texinfo automake autoconf apt-transport-https \
    cppman fuse xsel xclip \
    ccache cmake make g++-multilib gdb lldb pkg-config coreutils python3-pexpect manpages-dev ninja-build capnproto libcapnp-dev zlib1g-dev libzstd-dev \
    libkf5syntaxhighlighting-dev bfs zsh libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev icu-devtools libicu-dev \
    libwebkit2gtk-4.0-dev wget file libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev ca-certificates software-properties-common \
    fontconfig libegl1 libwayland-egl1 libxcursor1 libxkbcommon-x11-0

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install mise
curl https://mise.run | sh

# Clone antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-$HOME}/.antidote"

# Enable experimental features in mise
mise settings set experimental true

# Move /usr/local/bin and create a symlink
sudo mv /usr/local/bin /usr/local/BAKbin
sudo ln -s ~/.local/share/mise/shims/ /usr/local/bin

# Install snapd and protobuf-compiler
sudo apt-get install -y snapd protobuf-compiler

# Install Vim, Neovim, and Nano via Snap
sudo snap install vim --classic
sudo snap install nvim --classic
sudo snap install nano --classic

# Install nanorc
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# Install various tools and languages using mise
mise use -g go:github.com/rs/curlie@latest
mise use -g sccache -y
mise use -g cargo:cargo-binstall
mise use -g cmake just make maven -y
mise use -g deno dotnet go java kotlin lua maven nim node python zig -y
mise use -g bun conan pipx pnpm yarn -y
mise use -g fzf git hurl jq shellcheck shfmt tmux -y
mise use -g bat bat-extras chisel delta dust eza fd glow lazygit sshuttle starship tokei watchexec zoxide -y
mise use -g cargo:bottom cargo:fclones cargo:macchina cargo:onefetch cargo:procs cargo:tealdeer cargo:trippy
mise use -g cargo:bingrep cargo:dtool cargo:grex cargo:hexyl cargo:lemmeknow cargo:qsv cargo:zipsign
mise use -g npm:localtunnel npm:prettier npm:tiktok-scraper

# Install cargo-watch
cargo install cargo-watch --locked

# Install additional Cargo tools
cargo binstall atuin bacon cargo-audit cargo-make cargo-outdated cargo-show-asm cargo-update cargo-wipe mdcat ripgrep ripgrep_all
