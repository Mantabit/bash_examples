#!/bin/bash

testpackage=libarmadillo4

echo "list all files which were imported from package $testpackage"
dpkg -L $testpackage

#echo "list all packages currently installed"
#apt list --installed

echo "search for $testpackage in installed packages"
apt list --installed | grep $testpackage

#find all .deb files on the current machine
sudo updatedb
apt locate *.deb
