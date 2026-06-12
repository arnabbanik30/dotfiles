## https://grpc.io/docs/languages/go/quickstart/
function install_protoc() {
  echo "[info:go_grpc]: installing protoc-gen-go"
  if __is_installed "protoc-gen-go"; then
    echo "[info:go_grpc]: protoc-gen-go is already installed, Skipping..."
    return 0

  else
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
  fi
}

function install_go_generator() {
  echo "[info:go_grpc]: installing protoc-gen-go-grpc"
  if __is_installed "protoc-gen-go-grpc"; then
    echo "[info:go_grpc]: protoc-gen-go-grpc is already installed, Skipping..."
    return 0
  else
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
  fi
}

function __install_protoc_plugins() {
  if ! __is_installed "go"; then
    echo "[error]: Go is required for installing go grpc plugins, Skipping..."
    return 0
  fi

  ## Protobuf compiler
  install_protoc

  ## Go code generator
  install_go_generator

}

echo "[info]: Installing Go GRPC Plugins"
__install_protoc_plugins
