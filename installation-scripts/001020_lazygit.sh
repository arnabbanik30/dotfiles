## https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation

function run() {
  case "${_pkg_mgr}" in
  apt-get)
    #I need to do this for mint. As apt-get in mint doesn't package lazygit. idk why tf not.
    local ARCH=$(uname -m)
    [ "$ARCH" = "aarch64" ] && ARCH="arm64"
    local LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r '.tag_name | sub("^v"; "")')
    local URL="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_linux_${ARCH}.tar.gz"

    curl -Lo ~/Downloads/lazygit.tar.gz $URL
    tar xzvf ~/Downloads/lazygit.tar.gz -C ~/Downloads lazygit
    sudo install ~/Downloads/lazygit /usr/local/bin

    rm ~/Downloads/lazygit.tar.gz ~/Downloads/lazygit
    ;;
  brew) brew install lazygit ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac

}

function __install_lazygit() {
  if __is_installed "lazygit"; then
    echo "[info]: Lazygit is already installed. Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Lazygit"
__install_lazygit

