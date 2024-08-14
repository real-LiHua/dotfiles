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

mount -vo compress=zstd "$disk"2 /mnt
echo -n ,home,log,pkg,.snapshots | xargs -i -d, btrfs -v subvolume create /mnt/@{}
umount -vR /mnt

mount -vo compress=zstd,subvol=@           "$disk"2 /mnt
mkdir -vp /mnt/{boot,home,var/log,var/cache/pacman/pkg,.snapshots}
mount -v "$disk"1 /mnt/boot
mount -vo compress=zstd,subvol=@home       "$disk"2 /mnt/home
mount -vo compress=zstd,subvol=@log        "$disk"2 /mnt/var/log
mount -vo compress=zstd,subvol=@pkg        "$disk"2 /mnt/var/cache/pacman/pkg
mount -vo compress=zstd,subvol=@.snapshots "$disk"2 /mnt/.snapshots

curl -sO 'https://www.blackarch.org/keyring/blackarch-keyring.pkg.tar.xz'
curl -sO 'https://www.blackarch.org/keyring/blackarch-keyring.pkg.tar.xz.sig'
gpg --receive-keys  4345771566D76038C7FEB43863EC0ADBEA87E4E3
gpg --keyserver-options no-auto-key-retrieve --with-fingerprint blackarch-keyring.pkg.tar.xz.sig
pacman --noconfirm -U blackarch-keyring.pkg.tar.xz

archinstall \
    --config https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_configuration.json \
    --creds https://raw.githubusercontent.com/real-LiHua/dotfiles/main/user_credentials.json \
    --silent \
    --script guided \
    --debug \
    --skip-version-check
