#pacman -Sy --needed --noconfirm archlinux-keyring
#pacman-key --lsign-key "farseerfc@archlinux.org"
sed -i '/.* raw.githubusercontent.com/d' /etc/hosts || true
for ip in 185.199.{108..111}.133; do
    curl --connect-timeout 1 \
         --resolve raw.githubusercontent.com:443:$ip \
         -sLo /dev/null https://raw.githubusercontent.com && \
    echo "$ip raw.githubusercontent.com" | tee -a /etc/hosts && break
done || echo '185.199.109.133 raw.githubusercontent.com' | tee -a /etc/hosts

archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --skip-version-check
