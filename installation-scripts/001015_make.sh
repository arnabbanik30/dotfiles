function run() {
  case "${_pkg_mgr}" in
  apt-get) sudo apt-get install -y make ;;
  brew) brew install make ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_make() {
  case "${_pkg_mgr}" in
  apt-get)
    if __is_installed "make"; then
      echo "[info]: GNU Make is already installed. Skipping..."
      return 0
    fi
    ;;
  brew)
    if __is_installed "gmake"; then
      echo "[info]: GNU make (gmake) is already installed. Skipping..."
      return 0
    fi

    ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

  run
}

echo "[info]: Installing make"
__install_make
