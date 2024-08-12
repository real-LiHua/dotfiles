pacman-key --init
pacman-key --populate archlinux
pacman-key --lsign-key  "farseerfc@archlinux.org" 
archinstall --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json --silent --script guided
