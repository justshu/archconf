#!/bin/bash

echo "Enable Multilib repo"
read yn10
if [ $yn10 = 'Y' ] || [ $yn10 = 'y' ]
then
vim /etc/pacman.conf
fi
clear

echo "Install Linux"
read yn9
if [ $yn9 = 'Y' ] || [ $yn9 = 'y' ]
then
pacman -Sy base linux linux-headers linux-firmware sof-firmware sudo vim networkmanager reflector systemd mkinitcpio
fi
clear

echo "Install Basic Components"
read yn1
if [ $yn1 = 'Y' ] || [ $yn1 = 'y' ]
then
pacman -Sy base-devel git wget pacman-contrib xdg-user-dirs bash-completion man-pages man-db
fi
clear

echo "Install Filesystems"
read yn2
if [ $yn2 = 'Y' ] || [ $yn2 = 'y' ]
then
pacman -Sy dosfstools mtools ntfs-3g exfatprogs gvfs
fi
clear

echo "Install TUI Packages"
read yn3
if [ $yn3 = 'Y' ] || [ $yn3 = 'y' ]
then
pacman -Sy neofetch cmatrix htop tree speedtest-cli
fi
clear

echo "Install Services"
read yn8
if [ $yn8 = 'Y' ] || [ $yn8 = 'y' ]
then
pacman -Sy cups samba openssh ufw networkmanager
fi
clear

echo "Enabling Services"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable cups
systemctl enable ufw
systemctl enable fstrim.timer

echo "Install Basic Drivers"
read yn4
if [ $yn3 = 'Y' ] || [ $yn3 = 'y' ]
then
pacman -Sy xorg xorg-server pipewire pipewire-pulse pipewire-alsa pipewire-jack alsa-utils alsa-plugins lib32-pipewire lib32-pipewire-jack
fi
clear

echo "Install NVIDIA Drivers"
read yn5
if [ $yn5 = 'Y' ] || [ $yn5 = 'y' ]
then
pacman -Sy nvidia nvidia-utils lib32-nvidia-utils opencl-nvidia lib32-opencl-nvidia nvidia-settings
fi
clear

echo "EDIT mkinitcpio.conf for nvidia modules"
read yn6
if [ $yn6 = 'Y' ] || [ $yn6 = 'y' ]
then
vim /etc/mkinitcpio.conf
fi
clear

echo "Add nvidia-drm.modeset=1 into your kernel parameter [Press 'o' to continue]"
read o
if [ $o = 'o' ]
then
clear
fi
clear

echo "Install Plasma"
read yn7
if [ $yn7 = 'Y' ] || [ $yn7 = 'y' ]
then
pacman -Sy plasma sddm konsole dolphin kate spectacle kcalc okular ffmpegthumbs kdegraphics-thumbnailers
fi
