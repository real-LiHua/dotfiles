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
mkdir -v /mnt/archinstall
mount -vo compress=zstd "$disk"2 /mnt/archinstall
echo -n ,home,opt,usr,var | xargs -i -d, btrfs -v subvolume create /mnt/archinstall/@{}
umount -vR /mnt/archinstall
mount  -vo compress=zstd,subvol=@ "$disk"2 /mnt/archinstall
mkdir  -v /mnt/archinstall/{boot,home,opt,usr,var}
mount  -v "$disk"1 /mnt/archinstall/boot
echo -n  home,opt,usr,var | xargs -i -d, \
    mount -vo compress=zstd,subvol=@{} "$disk"2 /mnt/archinstall/{}
chattr +C /mnt/archinstall/var
archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --debug \
    --skip-version-check
