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

# install fast and standard build tools

$ sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
$ sudo apt-get install -y autopoint gettext groff texinfo automake autoconf 
$ sudo apt install cppman
$ sudo apt install fuse xsel xclip
$ sudo apt update && apt install -y git curl bsdmainutils file unzip make autoconf gcc zlib1g-dev openssl expat libc6 gettext



# wsl stuff
$ sudo apt update && sudo apt install -y fontconfig libegl1 libwayland-egl1 libxcursor1 libxkbcommon-x11-0

$ mise use -g go:github.com/rs/curlie@latest
$ muse use -g sccache
$ mise use -g cargo:cargo-binstall
$ mise use -g cmake just make maven

# languages to install
$ mise use -g deno dotnet go java kotlin lua maven nim node python zig

# tools to install

# package managers to install
$ mise use -g bun conan pipx pnpm yarn

# standard system tools
$ mise use -g fzf git hurl jq nano shellcheck shfmt tmux vim

# utilities
$ mise use -g bat bat-extras bfs chisel delta dust eza fd glow gitui lazygit sshuttle starship tokei watchexec zoxide


# other utilties
$ mise use -g cargo:bottom cargo:fclones cargo:macchina cargo:onefetch cargo:procs cargo:tealdeer cargo:trippy

$ mise use -g cargo:bingrep cargo:dtool cargo:grex cargo:hexyl cargo:lemmeknow cargo:qsv cargo:zipsign

$ mise use -g npm:localtunnel npm:prettier npm:tiktok-scraper

```
