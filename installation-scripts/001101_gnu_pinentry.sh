function run() {
  local CONFIG_FILE="$HOME/.gnupg/gpg-agent.conf"
  case "${_pkg_mgr}" in
  apt)
    sudo apt update
    sudo apt install -y pinentry-gnome3
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo "pinentry-program /usr/bin/pinentry-gnome3" >>"$CONFIG_FILE"
    ;;
  brew)
    brew install pinentry-mac
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >>"$CONFIG_FILE"
    ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

  gpgconf --kill gpg-agent
}

function __install_gnu_pinentry() {
  if __is_installed "pinentry-gnome3" || __is_installed "pinentry-mac"; then
    echo "[info]: Gnu Pinentry is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Gnu Pinentry"
__install_gnu_pinentry
