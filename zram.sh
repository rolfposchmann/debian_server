apt install zram-tools

nano /etc/default/zramswap


cat /proc/sys/vm/swappiness


nano /etc/sysctl.conf
vm.swappiness=10
