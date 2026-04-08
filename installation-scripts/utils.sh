function __set_pkg_mgr() {
  for pkg in brew apt pacman; do
    if command -v $pkg >/dev/null 2>&1; then
      _pkg_mgr=$pkg
    fi
  done
}

function __is_installed() {
  if [ "$#" -ne 1 ]; then
    return 1
  fi

  local app=$1

  command -v $app >/dev/null 2>&1
}

##################################################

__set_pkg_mgr
