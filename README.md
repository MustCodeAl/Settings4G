# Settings4G
Broken Terminal Settings
 will fix some stuff later but for now the work around is `bash` then `zsh` then `source ~/.zshrc`


```sh
# install tweaks from this repo
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ curl https://mise.run | sh
$ https://gitlab.com/kalilinux/packages/kali-tweaks/-/tree/kali/master
$ git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

# allow mise to use go and cargo installers
$ mise settings set experimental true

# setup os to use mise installs as defaults 
$ sudo mv /usr/local/bin /usr/local/BAKbin
$ sudo ln -s ~/.local/share/mise/shims/ /usr/local/bin

# install fast and standard build tools

$ sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncurses-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
$ sudo apt-get install -y autopoint gettext groff texinfo automake autoconf 
$ sudo apt install cppman
$ sudo apt install fuse xsel xclip
$ sudo apt update && apt install -y git curl bsdmainutils file unzip make autoconf gcc zlib1g-dev openssl expat libc6 gettext
$ sudo apt-get install ccache cmake make g++-multilib gdb lldb \
  pkg-config coreutils python3-pexpect manpages-dev git \
  ninja-build capnproto libcapnp-dev zlib1g-dev libzstd-dev
$ sudo apt install libkf5syntaxhighlighting-dev
$ sudo apt install bfs zsh
$ sudo apt-get install libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev icu-devtools libicu-dev


# wsl stuff
$ sudo apt update && sudo apt install -y fontconfig libegl1 libwayland-egl1 libxcursor1 libxkbcommon-x11-0

$ mise use -g go:github.com/rs/curlie@latest
$ muse use -g sccache -y
$ mise use -g cargo:cargo-binstall
$ mise use -g cmake just make maven -y

# languages to install
$ mise use -g deno dotnet go java kotlin lua maven nim node python zig -y

# tools to install

# package managers to install
$ mise use -g bun conan pipx pnpm yarn -y

# standard system tools
$ mise use -g fzf git hurl jq nano shellcheck shfmt tmux vim -y

# utilities
$ mise use -g bat bat-extras chisel delta dust eza fd glow lazygit sshuttle starship tokei watchexec zoxide -y


# other utilties
$ mise use -g cargo:bottom cargo:fclones cargo:macchina cargo:onefetch cargo:procs cargo:tealdeer cargo:trippy

$ mise use -g cargo:bingrep cargo:dtool cargo:grex cargo:hexyl cargo:lemmeknow cargo:qsv cargo:zipsign

$ mise use -g npm:localtunnel npm:prettier npm:tiktok-scraper

$ cargo install cargo-watch --locked

$ cargo binstall atuin bacon cargo-audit cargo-make cargo-outdated cargo-show-asm cargo-update cargo-wipe mdcat ripgrep ripgrep_all
```
