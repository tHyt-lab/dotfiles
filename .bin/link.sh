#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Link .gitconfig from project root
ln -fnsv "${PROJECT_ROOT}/.gitconfig" "$HOME/.gitconfig"

# Link .zshrc from zsh directory
ln -fnsv "${PROJECT_ROOT}/zsh/.zshrc" "$HOME/.zshrc"

# Link .p10k.zsh from zsh directory
ln -fnsv "${PROJECT_ROOT}/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# Link .config from project root
ln -fnsv "${PROJECT_ROOT}/.config" "$HOME/.config"