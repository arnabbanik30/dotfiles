#!/usr/bin/env zsh

source "./utils.sh"

## Run the install scripts
for script in ./[0-9]*_*.(sh|zsh)(Nn); do
	source "$script"
done