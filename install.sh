#pacman -Sy --needed --noconfirm archlinux-keyring
#pacman-key --lsign-key "farseerfc@archlinux.org"
archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --skip-version-check
