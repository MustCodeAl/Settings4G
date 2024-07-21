#/bin/bash
mise "$@"

if [ "$1" == "use" ] && [ "$2" == "-g" ]; then
  for file in $HOME/.local/share/mise/shims/*; do
    sudo ln -sf "$file" /usr/local/bin
  done
fi
