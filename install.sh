pacman-key --init
pacman-key --populate archlinux
pacman-key --lsign-key  "farseerfc@archlinux.org" 
archinstall --config https://cdn.jsdelivr.net/gh/real-LiHua/dotfiles/user_configuration.json
