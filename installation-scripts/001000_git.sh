## https://git-scm.com/install/linux 

function run() {
	case "${_pkg_mgr}" in
	apt) sudo apt install -y git ;;
	brew) brew install git ;;
	*)
		echo "Unknown package manager ${_pkg_mgr}"
		return 1
		;;
	esac

}

function __install_git() {
	if __is_installed "git"; then
		echo "[info]: Git is already installed. Skipping..."
		return 0
	fi

	run
}


__install_git