#!/bin/bash

# Function to display messages
function message() {
    echo -e "\n\n$1\n\n"
}

# Function to install common dependencies
function install_common_dependencies() {
    sudo apt update
    sudo apt-get install -y apt-transport-https ca-certificates software-properties-common \
        build-essential cmake coreutils curl cppman git gcc make mold ninja-build \
        autopoint automake autoconf capnproto gettext groff texinfo bfs bsdmainutils \
        expat file wget unzip openssl libc6 ccache g++-multilib gdb lldb pkg-config \
        python3-pexpect manpages-dev tk-dev xz-utils libssl-dev libbz2-dev libreadline-dev \
        libncurses-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libkf5syntaxhighlighting-dev \
        libsqlite3-dev libcapnp-dev zlib1g-dev libzstd-dev libreadline-dev libcurl4-openssl-dev \
        uuid-dev icu-devtools libicu-dev libwebkit2gtk-4.0-dev libgtk-3-dev \
        libayatana-appindicator3-dev librsvg2-dev
}

# Check if the current environment is WSL
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    message "WSL environment detected. Installing WSL-specific dependencies..."
    
    # Install common dependencies
    install_common_dependencies

    # Install WSL-specific dependencies
    sudo apt update && sudo apt install -y fontconfig libegl1 libwayland-egl1 libxcursor1 libxkbcommon-x11-0 fuse xsel xclip \
        alsa-utils fonts-hack mesa-utils mesa-vulkan-drivers wl-clipboard wslu \
        xdg-desktop-portal xdg-desktop-portal-gtk xserver-xorg zenity

elif grep -qEi "Ubuntu" /etc/os-release &> /dev/null; then
    message "Ubuntu environment detected. Installing Ubuntu-specific dependencies..."
    
    # Install common dependencies
    install_common_dependencies

    # Add any Ubuntu-specific dependencies if needed
    # e.g., sudo apt-get install <ubuntu-specific-package>
else
    message "Unsupported environment detected. Exiting..."
    exit 1
fi

# Snap installations
message "Installing snap packages..."
sudo snap install vim --classic
sudo snap install nvim --classic
sudo snap install nano --classic

# Configure nano
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# Install mise (a tool used in the repository)
message "Installing mise..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl https://mise.run | sh

# Allow mise to use go and cargo installers
mise settings set experimental true

# Setup os to use mise installs as defaults 
sudo mv /usr/local/bin /usr/local/BAKbin
sudo ln -s ~/.local/share/mise/shims/ /usr/local/bin

# Install various tools and languages
message "Using mise to install various tools and languages..."
mise use -g go:github.com/rs/curlie@latest
mise use -g usage -y
mise use -g sccache -y
mise use -g cargo:cargo-binstall
mise use -g cmake just make maven -y
mise use -g deno dotnet go java kotlin lua maven nim node python zig -y
mise use -g bun pipx -y
mise use -g fzf git hurl jq shellcheck shfmt tmux -y
mise use -g bat bat-extras chisel delta dust eza fd glow lazygit sshuttle starship tokei watchexec zoxide -y
mise use -g cargo:bottom cargo:fclones cargo:macchina cargo:onefetch cargo:procs cargo:tealdeer cargo:trippy
mise use -g cargo:bingrep cargo:dtool cargo:grex cargo:hexyl cargo:lemmeknow cargo:qsv cargo:zipsign
mise use -g npm:localtunnel npm:prettier npm:tiktok-scraper
cargo install cargo-watch --locked
cargo binstall atuin bacon cargo-audit cargo-make cargo-outdated cargo-show-asm cargo-update cargo-wipe mdcat ripgrep ripgrep_all

message "Dependencies installed!"

# Clone repository
message "Cloning repository..."
git clone https://github.com/MustCodeAl/Settings4G.git

# Create necessary directories
message "Creating necessary directories..."
mkdir -p $HOME/.config/bat
mkdir -p $HOME/.config/atuin
mkdir -p $HOME/.config/tealdeer

# Copy configuration files
message "Copying configuration files..."
cp Settings4G/.zshrc $HOME/.zshrc
# cp Settings4G/.lesspipe $HOME/.lesspipe (File not found)
# cp Settings4G/bat/config.toml $HOME/.config/bat/config.toml (File not found)
cp Settings4G/dotfiles/.config/atuin/config.toml $HOME/.config/atuin/config.toml
cp Settings4G/.zsh_plugins.txt $HOME/.zsh_plugins.txt
cp Settings4G/.config/tealdeer/config.toml $HOME/.config/tealdeer/config.toml

message "Installation complete!"

# Optionally, source the .zshrc file to apply changes
# source $HOME/.zshrc
