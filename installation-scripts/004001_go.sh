function run() {
  case "${_pkg_mgr}" in
  apt-get)
    local ARCH=$(uname -m)
    [ "$ARCH" = "aarch64" ] && ARCH="arm64"

    local GO_LATEST_VERSION=$(curl -s "https://go.dev/dl/?mode=json" | jq -r ".[0].version")
    local URL="https://go.dev/dl/${GO_LATEST_VERSION}.linux-${ARCH}.tar.gz"

    curl -Lo ~/Downloads/go.tar.gz $URL
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzvf ~/Downloads/go.tar.gz

    rm ~/Downloads/go.tar.gz
    ;;

  brew) brew install go ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_go() {
  if __is_installed "go"; then
    echo "[info]: Go is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Go"
__install_go
