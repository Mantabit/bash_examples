sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt update
sudo apt install boot-loader

sudo apt-get install syslinux
sudo dd if=/usr/lib/syslinux/mbr.bin of=/dev/sda
sudo apt-get install mbr
sudo install-mbr -i n -p D -t 0 /dev/sda

sudo apt-get install lilo
sudo lilo -M /dev/sda mbr
