#pacman -Sy --needed --noconfirm archlinux-keyring
#pacman-key --lsign-key "farseerfc@archlinux.org"
sed -i '/.* raw.githubusercontent.com/d' /etc/hosts
for ip in 185.199.{108..111}.133; do
    curl --connect-timeout 1 \
         --resolve raw.githubusercontent.com:443:$ip \
         -sLo /dev/null https://raw.githubusercontent.com && \
    echo "$ip raw.githubusercontent.com" | tee -a /etc/hosts && break
done

archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --silent \
    --script guided \
    --skip-version-check
