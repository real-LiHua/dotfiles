disk='/dev/sda'
sfdisk --delete "$disk"
parted -sa  opt "$disk"             \
    mklabel gpt                     \
    mkpart  EFI     fat32   1M 1G   \
    mkpart  primary btrfs   1G 100% \
    set     1       esp     on      \
    set     2       root    on
mkfs.fat -vF 32 "$disk"1
mkfs.btrfs -vfn 32k "$disk"2
mount -vo compress=lzo "$disk"2 /mnt/arch_btrfs
echo -n ,home,opt,usr,var | xargs -i -d, btrfs -v subvolume create /mnt/arch_btrfs/@{}
umount -v /mnt/arch_btrfs
mount  -vo noatime,nodiratime,compress=lzo,subvol=@ "$disk"2 /mnt/archinstall
mkdir  -v /mnt/archinstall/{boot,home,opt,usr,var}
mount  -vo noatime,nodiratime "$disk"1 /mnt/archinstall/boot
echo -n  home,opt,usr,var | xargs -i -d, \
    mount -vo noatime,nodiratime,compress=lzo,subvol=@{} "$disk"2 /mnt/archinstall/{}
chattr +C /mnt/var
archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --skip-version-check
