disk='/dev/sda'
sfdisk --delete "$disk"
shred -zvs 251M "$disk"
parted -sa  opt "$disk"             \
    mklabel gpt                     \
    mkpart  EFI     fat32   1M 1G   \
    mkpart  primary btrfs   1G 100% \
    set     1       esp     on      \
    set     2       root    on
mkfs.fat -vF 32 "$disk"1
mkfs.btrfs -vfn 32k "$disk"2
mount -vo compress=lzo "$disk"2 /mnt
echo -n ,home,opt,usr,var | xargs -i -d, btrfs -v subvolume create /mnt/@{}
umount -v /mnt
mount  -vo noatime,nodiratime,compress=lzo,subvol=@ "$disk"2 /mnt
mkdir  -v /mnt/{boot,home,opt,usr,var}
mount  -vo noatime,nodiratime "$disk"1 /mnt/boot &
echo -n  home,opt,usr,var | xargs -i -d, \
    mount -vo noatime,nodiratime,compress=lzo,subvol=@{} "$disk"2 /mnt/{}
chattr +C /mnt/var
archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --skip-version-check
