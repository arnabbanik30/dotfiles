function run() {
  case "${_pkg_mgr}" in
  apt)
    sudo apt update
    sudo apt install -y gnupg
    ;;
  brew) brew install gnupg ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_gnupg() {
  if __is_installed "gpg"; then
    echo "[info]: GnuPg (gpg) is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing GnuPg (gpg)"
__install_gnupg
