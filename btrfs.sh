Links: https://seravo.fi/2016/perfect-btrfs-setup-for-a-server

btrfs fi usage /

#creat snapshots
mkdir /snapshots
btrfs subvol snapshot -r / /snapshots/root.$(date +%Y-%m-%d_%Hh%Mm)
Create a readonly snapshot of '/' in '/snapshots/root.20160919-0954'

#restore
btrfs sub del /
btrfs subvol snapshot -r / /snapshots/root.$(date +%Y-%m-%d_%Hh%Mm)

tree -L 3 /snapshots


To be able to track how much disk space a snapshot uses, 
or more exactly to view the amount of data that changed between two snapshots, 
we can use Btrfs quota groups. The are not enabled by default, so start by running:

bftrs quota enable /

btrfs qgroup show /

btrfs subvolume list /



#mounten
mount -t btrfs -o subvolid=256,compress /dev/sda5 /mnt 

#mount ROOT of all subvol:
mount -o subvol=/ /dev/sda1 /mnt

#creat subvol
btrfs subvol create mynewrootsubvol
btrfs subvol create /mnt/mynewrootsubvol

#default subvol:
btrfs subvol list /
btrfs subvol list .

btrfs subvol set-default 257 .

btrfs subvol get-default /

btrfs subvolume set-default /mnt

