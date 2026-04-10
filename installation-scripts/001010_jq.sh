function run() {
  case "${_pkg_mgr}" in
  apt) sudo apt install -y jq ;;
  brew) brew install jq ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_jq() {
  if __is_installed "jq"; then
    echo "[info]: jq is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing jq"
__install_jq
