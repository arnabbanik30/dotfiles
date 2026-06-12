## https://github.com/pressly/goose
function run() {
  go install github.com/pressly/goose/v3/cmd/goose@latest
}

function __install_goose() {
  if ! __is_installed "go"; then
    echo "[error]: Go is required for installing goose, Skipping..."
    return 0
  fi

  if __is_installed "goose"; then
    echo "[info]: Goose is already installed, Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Goose"
__install_goose
