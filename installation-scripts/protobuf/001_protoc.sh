function run() {
  case "${_pkg_mgr}" in
  apt-get) sudo apt-get install -y protobuf-compiler ;;
  brew) brew install protobuf -y ;;
  *)
    echo "[info:protoc]: Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_protoc() {
  if __is_installed "protoc"; then
    echo "[info:protoc]: Protoc is already installed. Skipping..."
    return 0
  fi

  run
}

__install_protoc
