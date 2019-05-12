#!/bin/bash

#this script illustrates how to format a usb drive, create a gpt partition table and generate two partitions (one fat32 and one ext4)

lsblk
sudo umount /dev/sde0				#unmount all partitions of the drive that are currently mounted
sudo umount /dev/sde1				
sudo parted /dev/sde mklabel gpt					#create an empty GPT partition table on the drive /dev/sde
sudo parted /dev/sde mkpart primary fat32 0% 50%	#create a fat32 entry in the GPT for a fat32 filesystem
sudo parted /dev/sde mkpart primary ext4 50% 100%	#create a ext4 entry in the GPT for an ext4 filesystem
sudo mkfs -t vfat /dev/sde1
sudo mkfs -t ext4 /dev/sde2
