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
echo -n ,home,log,pkg,.snapshots | xargs -i -d, btrfs -v subvolume create /mnt/archinstall/@{}
umount -vR /mnt/archinstall
mount  -vo compress=zstd,subvol=@ "$disk"2 /mnt/archinstall
mkdir  -vp /mnt/archinstall/{boot,home,var/log,var/cache/pacman/pkg,.snapshots}
mount  -v "$disk"1 /mnt/archinstall/boot
mount -vo compress=zstd,subvol=@home       "$disk"2 /mnt/archinstall/home
mount -vo compress=zstd,subvol=@log        "$disk"2 /mnt/archinstall/var/log
mount -vo compress=zstd,subvol=@pkg        "$disk"2 /mnt/archinstall/var/cache/pacman/pkg
mount -vo compress=zstd,subvol=@.snapshots "$disk"2 /mnt/archinstall/.snapshots
archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --debug \
    --skip-version-check
