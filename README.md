# Settings4G
Broken Terminal Settings
 will fix some stuff later but for now the work around is `bash` then `zsh` then `source ~/.zshrc`




```sh 

# allow mise to use go and cargo installers
mise settings set experimental true

# install fast and standard build tools
$ mise use -g go:https://github.com/rs/curlie
$ mise use -g cargo:cargo-binstall
$ mise use -g cmake just make maven sccache

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
