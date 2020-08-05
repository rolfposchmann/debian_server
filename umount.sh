umount /mnt
#umount: /mnt: target is busy.
#Notfall: umount -l /mnt
#besser:

# apt install lsof
lsof /mnt

# apt install psmisc
fuser -m /mnt

kill [PID]
