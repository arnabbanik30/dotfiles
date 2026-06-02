## https://docs.sqlc.dev/en/latest/overview/install.html
function run() {
  go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
}

function __install_sqlc() {
  if ! __is_installed "go"; then
    echo "[error]: Go is required for installing sqlc, Skipping..."
    return 0
  fi

  if __is_installed "sqlc"; then
    echo "[info]: Sqlc is already installed, Skipping..."
    return 0
  fi

  run
}

echo "[info]: Installing Sqlc"
__install_sqlc
