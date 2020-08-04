#Creat filesystems


mkfs.btrfs -L root /dev/sda3

#Set defaults (Grund: wenn /dev/sda3 gemoutet wird, wird automatisch das subvol als default genommen!)

#Start installer

#Mount /target
mount -t btrfs /dev/sda3 /target
mount -t btrfs -o subvol=@ /dev/disk/by-label/root /target


