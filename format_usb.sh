#!/bin/bash

#instead of using this script, it's also possible to use:
#parted /dev/sdc

if [[ $(id -u) -ne 0 ]]; then
	echo "script needs to be run as root, abandoning operation";
	exit 1;
fi

#first, list all available block devices
lsblk
echo
echo "Select the USB drive from the list above (e.g. /dev/sdc) (lsblk): "
read usbdrive
echo "USB drive to be formatted: $usbdrive"

#1.)	check if a partition table has already been created, if no create one
echo "Have you already created the new partition table (needs to be done first...) [Y/N]?"
read answer
if [ "$answer" = "N" ]; then
	#create a new partition table, OS needs to be rebooted afterwards
	echo "Creating partition table. Choose the partition-table type (aix, amiga, dvh, gpt, loop, mac, msdos, pc98, sun)"
	read parttable
	echo "Partiton Type: $parttype"
	parted $usbdrive mklabel $parttable

fi

#2.)	create the primary logical partition and mark that partition as a certain filesystem
#Hint: this will not create the actual filesystem on that parition (for example superblock etc.)
#Another call to mkfs is necessary to create the filesystem
echo "Choose the partition type (primary,logical,extended)"
read parttype
echo "Choose the filesystem type (fat16,fat32,ext3,ext4)"
read filesys
parted $usbdrive mkpart $parttype  0% 100% $filesys

#3.)	write the actual file system information (super block etc...)
mkfs -t $filesys $usbdrive

#4.)	try to mount the filesystem
echo "Trying to mount the new filesystem..."
mount ${usbdrive}1 /mnt
