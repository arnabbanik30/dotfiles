function install_tpm() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function run() {
  case "${_pkg_mgr}" in
  apt-get)
    sudo apt-get udpate
    sudo apt-get install -y tmux
    install_tpm
    ;;
  brew)
    brew install tmux
    install_tpm
    ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac
}

function __install_tmux_tpm() {
  if __is_installed "tmux"; then
    echo "[info]: Tmux is already installed. Skipping"
    return 0
  fi

  run
}

echo "[info]: Installing tmux and tpm"
__install_tmux_tpm
