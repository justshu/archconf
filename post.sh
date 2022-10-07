#!/bin/bash

echo "Updating System"
sudo pacman -Syu
clear

echo "Install Firefox and Disk Utils"
read yn1
if [ $yn1 = 'Y' ] || [ $yn1 = 'y' ]
then
sudo pacman -Sy firefox gparted gnome-disk-utility
fi
clear

echo "Install Office Suite and Productivity Tools"
read yn2
if [ $yn2 = 'Y' ] || [ $yn2 = 'y' ]
then
sudo pacman -Sy libreoffice libreoffice-fresh gimp inkscape scour
fi
clear

echo "Install Gaming Stuffs"
read yn3
if [ $yn3 = 'Y' ] || [ $yn3 = 'y' ] 
then
	echo "Install WINE too?"
	read yn4
	if [ $yn4 = 'Y' ] || [ $yn4 = 'y' ]
	then
	sudo pacman -Sy steam lutris discord wine-staging winetricks
	else
	sudo pacman -Sy steam lutris discord
	fi
fi
clear

echo "Install KeepassXC"
read yn5
if [ $yn5 = 'Y' ] || [ $yn5 = 'y' ]
then
sudo pacman -Sy keepassxc
fi
clear

echo "Install VirtualBox"
read yn6
if [ $yn6 = 'Y' ] || [ $yn6 = 'y' ]
then
sudo pacman -Sy virtualbox virtualbox-host-dkms virtualbox-guest-iso
sudo modprobe vboxdrv
fi
clear

echo "Install KVM"
read yn7
if [ $yn7 = 'Y' ] || [ $yn7 = 'y' ] 
then
sudo pacman -Sy qemu-desktop virt-manager libvirt dnsmasq ebtables openbsd-netcat edk2-ovmf swtpm
sudo systemctl enable libvirtd --now
sudo systemctl enable virtlogd.socket --now
sudo virsh net-autostart default
sudo virsh net-start default
sudo vim /etc/libvirt/libvirtd.conf
sudo vim /etc/libvirt/qemu.conf
fi
clear

echo "Install YAY"
read yn8
if [ $yn8 = 'Y' ] || [ $yn8 = 'y' ]
then
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
fi
clear

echo "Install YAY Packages"
read yn9
if [ $yn9 = 'Y' ] || [ $yn9 = 'y' ]
then
yay -Sy brave-bin stacer-bin timeshift-bin protonup-qt spotify
fi
clear

echo "Install WARP"
read yn10
if [ $yn10 = 'Y' ] || [ $yn10 = 'y' ]
then
yay -Sy cloudflare-warp-bin
warp-cli register
warp-cli connect
warp-cli enable-always-on
warp-cli set-families-mode malware
fi
clear

echo "Wanna reboot your pc?"
read yn11
if [ $yn11 = 'Y' ] || [ $yn11 = 'y' ]
then
sudo reboot
else
echo "You're all done, just reboot your pc and good to go! Have a nice day"
fi
