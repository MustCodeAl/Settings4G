# Settings4G
Broken Terminal Settings
 will fix some stuff later but for now the work around is `bash` then `zsh` then `source ~/.zshrc`

```consle
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast
```




for console customization:  https://github.com/MustCodeAl/awesome-colored-output


  
```console
# install tweaks from this repo
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

(one of these)
$ curl https://mise.run | sh
$ curl https://mise.run | MISE_INSTALL_PATH=/usr/local/bin/mise sh
$ curl https://mise.run | sudo sh -c 'MISE_INSTALL_PATH=/usr/local/bin/mise sh'

$ git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

# allow mise to use go and cargo installers
$ mise settings set experimental true

# setup os to use mise installs as defaults 
$ sudo mv /usr/local/bin /usr/local/BAKbin
$ sudo ln -s ~/.local/share/mise/shims/ /usr/local/bin
$ sudo apt install snapd
$ sudo apt install protobuf-compiler



# install fast and standard build tools
$ sudo apt-fast update
$ sudo apt-fast install ubuntu-standard util-linux
$ sudo apt-fast install -y apt-transport-https ca-certificates  software-properties-common
$ sudo apt-fast install build-essential devscripts coreutils bsdextrautils
$ sudo apt-fast install ninja-build mold gdb lldb pkg-config ccache g++-multilib cppman
$ sudo apt-fast install libssl-dev libbz2-dev libncurses-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-pexpect 
$ sudo apt-fast install libkf5syntaxhighlighting-dev libsqlite3-dev libcapnp-dev libzstd-dev 
$ sudo apt-fast install libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev icu-devtools libicu-dev
$ sudo apt-fast install libwebkit2gtk-4.0-dev libgtk-3-dev tk-dev libayatana-appindicator3-dev librsvg2-dev



$ sudo snap install vim --classic
$ sudo snap install nvim --classic # or install through nightly releases
$ sudo snap install nano --classic
$ curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh


$ sudo apt install bfs

$ mise use -g go:github.com/rs/curlie@latest
$ mise use -g curlie
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

$ cargo binstall atuin bacon cargo-audit cargo-fuzz cargo-make cargo-outdated cargo-show-asm cargo-update cargo-wipe grcov mdcat ripgrep ripgrep_all
```
