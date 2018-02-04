#!/bin/bash

# Driver install
# Based on: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-nvidia-driver.html

sudo apt-get install -y gcc linux-headers-$(uname -r)

cat << EOF | sudo tee --append /etc/modprobe.d/blacklist.conf
blacklist vga16fb
blacklist nouveau
blacklist rivafb
blacklist nvidiafb
blacklist rivatv
EOF

sudo sed -i.bak 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="nouveau.blacklist=1 /g' /etc/default/grub
sudo update-grub

# Driver install
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/375.74/NVIDIA-Linux-x86_64-375.74.run
sudo /bin/bash ./NVIDIA-Linux-x86_64-*.run --accept-license
rm NVIDIA-Linux-x86_64-*.run

sudo reboot
