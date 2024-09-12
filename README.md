# Settings4G
Broken Terminal Settings
 will fix some stuff later but for now the work around is `bash` then `zsh` then `source ~/.zshrc`

follow these guides if you are using wsl:
* https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/docker.html
* https://docs.nvidia.com/cuda/wsl-user-guide/index.html
* https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local
* https://github.com/wslutilities/wslu

  
```console
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
$ sudo apt-get install snapd
$ sudo apt-get install protobuf-compiler


# install fast and standard build tools
$ sudo apt update 
$ sudo apt-get install -y apt-transport-https ca-certificates  software-properties-common
$ sudo apt install build-essential cmake coreutils curl cppman git gcc make mold ninja-build
$ sudo apt-get install -y autopoint automake autoconf capnproto gettext groff texinfo
$ sudo apt install -y bfs bsdmainutils expat file wget unzip openssl libc6
$ sudo apt-get install ccache g++-multilib gdb lldb pkg-config python3-pexpect manpages-dev tk-dev xz-utils
$ sudo apt install libssl-dev libbz2-dev libreadline-dev libncurses-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
$ sudo apt install libkf5syntaxhighlighting-dev libsqlite3-dev libcapnp-dev zlib1g-dev libzstd-dev
$ sudo apt-get install libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev icu-devtools libicu-dev
$ sudo apt install libwebkit2gtk-4.0-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev

# wsl stuff
$ sudo apt update && sudo apt install -y fontconfig libegl1 libwayland-egl1 libxcursor1 libxkbcommon-x11-0 fuse xsel xclip 

# warpterm
$ sudo apt install alsa-utils fonts-hack mesa-utils mesa-vulkan-drivers wl-clipboard wslu
$ sudo apt install xdg-desktop-portal xdg-desktop-portal-gtk xserver-xorg zenity

$ sudo snap install vim --classic
$ sudo snap install nvim --classic # or install through nightly releases
$ sudo snap install nano --classic
$ curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh


$ mise use -g go:github.com/rs/curlie@latest
$ mise use -g usage -y
$ mise use -g sccache -y
$ mise use -g cargo:cargo-binstall
$ mise use -g cmake just make maven -y

# languages to install
$ mise use -g deno dotnet go java kotlin lua maven nim node python zig -y

# tools to install

# package managers to install
$ mise use -g bun pipx -y

# optional tools:
# mise use -g conan pnpm yarn

# standard system tools
$ mise use -g fzf git hurl jq shellcheck shfmt tmux -y

# utilities
$ mise use -g bat bat-extras chisel delta dust eza fd glow lazygit sshuttle starship tokei watchexec zoxide -y


# other utilties
$ mise use -g cargo:bottom cargo:fclones cargo:macchina cargo:onefetch cargo:procs cargo:tealdeer cargo:trippy

$ mise use -g cargo:bingrep cargo:dtool cargo:grex cargo:hexyl cargo:lemmeknow cargo:qsv cargo:zipsign

$ mise use -g npm:localtunnel npm:prettier npm:tiktok-scraper

$ cargo install cargo-watch --locked

$ cargo binstall atuin bacon cargo-audit cargo-make cargo-outdated cargo-show-asm cargo-update cargo-wipe mdcat ripgrep ripgrep_all
```
