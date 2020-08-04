#mount überprüfen
btrfs subvolume list .
btrfs subvol get-default /
btrfs subvolume show / | grep "Top level ID:"
btrfs subvol set-default 5 /
btrfs subvol get-default /


nano /etc/fstab
------------------------------------------------------------------
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>

#btrfs root subvol auf  /dev/sda3
UUID=73dae494-f849-4867-8629-f5546deb968e /               btrfs   defaults,ssd,noatime,compress=zstd,subvol=/@          0       0
# /boot/efi auf /dev/sda1
UUID=8068-4872                            /boot/efi       vfat    umask=0077                                    0       1
# swap auf /dev/sda2
UUID=d2d5ff52-df49-46f7-bdfb-6b91ff53a2ff none            swap    sw                                            0       0
#tmp
tmpfs                                     /tmp            tmpfs   rw,nosuid,nodev                               0       0


------------------------------------------------------------------

mount | grep btrfs
/dev/sda3 on / type btrfs (rw,noatime,compress=zstd,ssd,space_cache,subvolid=256,subvol=/@)
mount | grep tmpfs
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,relatime)

#=======================
# Netwerkkarten Treiber
#=======================

lsblk
mount /dev/sdb1 /mnt
dpkg -i firmware-bnx2_20190114-2_all.deb

ip addr

nano /etc/network/interfaces
------------------------------------------------------------------

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

auto eno1
iface eno1 inet dhcp

--------------------------------------------------------------------

systemctl status networking
systemctl restart networking

ip -4 addr
ping google.com




#sources.list

nano /etc/apt/sources.list
--------------------------------------------------------------
 deb http://deb.debian.org/debian/ buster main
 --------------------------------------------------------------
 
 https://debgen.github.io/
 https://wiki.debianforum.de/Sources.list
 ----------------------------------------------
deb [arch=amd64] http://ftp.de.debian.org/debian/ stable main contrib non-free

deb [arch=amd64] http://ftp.de.debian.org/debian/ stable-updates main contrib non-free

deb [arch=amd64] http://security.debian.org/ stable/updates main contrib non-free
 ----------------------------------------------

apt install net-tools





# SSH
apt update
apt install openssh-server
systemctl status ssh
systemctl enable ssh

mkdir -p /root/.ssh/
cp id_rsa.pub /root/.ssh/authorized_keys

nano /etc/ssh/sshd_config

systemctl restart ssh
systemctl status ssh

# Trim
systemctl enable fstrim.timer
systemctl start fstrim.timer

# swappiness
cat /proc/sys/vm/swappiness
# 60
sysctl vm.swappiness=10


#ntp
apt-get install ntp
systemctl status ntp

#timezone
dpkg-reconfigure tzdata

date
