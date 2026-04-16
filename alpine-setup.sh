#!/bin/sh
set -e

swapoff -a
sed -i '/^[^#].*[[:space:]]swap[[:space:]]/s/^/#/' /etc/fstab

touch "$HOME/.hushlogin"

sed -i 's/#\(.*\/community\)/\1/' /etc/apk/repositories

apk update
apk upgrade
apk add atuin atuin-zsh-completion atuin-zsh-plugin bash bat btop curl docker docker-cli-compose eza git github-cli intel-media-driver iproute2-ss lazygit lazydocker mesa-dri-gallium mesa-va-gallium mesa-vulkan-intel nano nano-syntax nfs-utils nodejs npm shadow starship-zsh-plugin tailscale zsh zsh-autosuggestions zsh-syntax-highlighting

rc-update add docker
rc-service docker start
rc-update add tailscale
rc-service tailscale start

mkdir -p "$HOME/.config" "$HOME/.config/nano" "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
touch "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

curl -fsSL -o "$HOME/.zshrc" https://raw.githubusercontent.com/chriscorbell/alpine/main/.zshrc
curl -fsSL -o "$HOME/.config/starship.toml" https://raw.githubusercontent.com/chriscorbell/alpine/main/.config/starship.toml
curl -fsSL -o "$HOME/.config/nano/nanorc" https://raw.githubusercontent.com/chriscorbell/alpine/main/.config/nano/nanorc

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSc9gHrkDHjyiDVKCPOIm1aJlbAGswe01RpgEsWdFV" >> "$HOME/.ssh/authorized_keys"

chsh -s "$(command -v zsh)"
