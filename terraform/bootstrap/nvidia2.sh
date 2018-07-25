#!/bin/bash

# Driver install
# Based on: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-nvidia-driver.html

sudo apt-get install -y gcc linux-headers-$(uname -r)

cat << EOF | sudo tee --append /etc/modprobe.d/blacklist-nvida.conf
blacklist vga16fb
blacklist nouveau
blacklist rivafb
blacklist nvidiafb
blacklist rivatv
options nouveau modeset=0
EOF

sudo sed -i.bak 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="nouveau.blacklist=1 /g' /etc/default/grub
sudo update-grub

# Driver install:
# For Instance p2 is a Tesla K-80
wget http://us.download.nvidia.com/tesla/396.37/NVIDIA-Linux-x86_64-396.37.run
sudo /bin/bash ./NVIDIA-Linux-x86_64-*.run --accept-license
rm NVIDIA-Linux-x86_64-*.run

sudo reboot
