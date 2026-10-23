#!/bin/sh
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d-%H%M%S)"

link() {
	src="${PROJECT_ROOT}/$1"
	dst="$HOME/$2"

	if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
		echo "skip: $dst"
		return
	fi

	mkdir -p "$(dirname "$dst")"
	# An old setup linked the whole ~/.config into this repo; backing up dst would then move this repo's own file.
	if [ "$(cd "$(dirname "$dst")" && pwd -P)/$(basename "$dst")" = "$(cd "$(dirname "$src")" && pwd -P)/$(basename "$src")" ]; then
		echo "error: $dst resolves to $src through a symlinked parent directory; remove that symlink first" >&2
		exit 1
	fi
	# [ -e ] is false for a dangling symlink, so -L is needed to back it up instead of silently overwriting it.
	if [ -L "$dst" ] || [ -e "$dst" ]; then
		mkdir -p "$(dirname "${BACKUP_DIR}/$2")"
		mv "$dst" "${BACKUP_DIR}/$2"
		echo "backup: $dst -> ${BACKUP_DIR}/$2"
	fi
	ln -s "$src" "$dst"
	echo "link: $dst -> $src"
}

while read -r src dst; do
	if [ -n "$src" ]; then
		link "$src" "$dst"
	fi
done < "${SCRIPT_DIR}/links.conf"
