function run() {
  case "${_pkg_mgr}" in
  apt)
    sudo apt update
    sudo apt install -y stow
    ;;
  brew) brew install stow ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_gnu_stow() {
  if __is_installed "stow"; then
    echo "[info]: Gnu Stow is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Gnu Stow"
__install_gnu_stow
