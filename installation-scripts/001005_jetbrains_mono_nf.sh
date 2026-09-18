function run() {
  case "${_pkg_mgr}" in
  apt-get)
    local temp_dir
    temp_dir=$(mktemp -d)
    echo "[info]: Downloading JetBrainsMono Nerd Font..."
    curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -o "$temp_dir/JetBrainsMono.zip"
    unzip -q "$temp_dir/JetBrainsMono.zip" -d "$temp_dir/jetbrains-mono"
    mkdir -p ~/.local/share/fonts
    find "$temp_dir/jetbrains-mono" -name "*.ttf" -exec cp {} ~/.local/share/fonts/ \;
    fc-cache -f
    rm -rf "$temp_dir"
    ;;
  brew)
    brew install --cask font-jetbrains-mono-nerd-font
    ;;
  *)
    echo "Unknown package manager ${_pkg_mgr}"
    return 1
    ;;
  esac
}

function __install_nf() {
  FONT_NAME="JetBrainsMono Nerd Font"
  if command -v fc-list &>/dev/null; then
    if fc-list : family | grep -qi "$FONT_NAME"; then
      echo "[info]: JetBrainsMono Nerd Font is already installed. Skipping"
      return 0
    fi
  fi
  run
}

echo "[info]: Installing JetBrainsMono Nerd Font"
__install_nf
