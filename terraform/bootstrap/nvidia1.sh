#!/bin/bash

# Kernel preparation for driver install

sudo apt-get update -y
sudo apt-get upgrade -y linux-aws

sudo reboot
