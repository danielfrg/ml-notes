#!/bin/bash

# Kernel preparation for driver install
# Based on: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-nvidia-driver.html

sudo apt-get update -y
sudo apt-get upgrade -y linux-aws

sudo reboot
