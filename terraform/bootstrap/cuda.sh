#!/bin/bash

# Based on: https://www.tensorflow.org/install/install_linux#tensorflow_gpu_support
# Based on: https://docs.nvidia.com/cuda/cuda-installation-guide-linux
# Download from: https://developer.nvidia.com/cuda-downloads

sudo apt install linux-source
sudo apt source linux-image-$(uname -r)
sudo apt install linux-headers-$(uname -r)

# CUDA Toolkit: 9.0 for tensorflow 1.9
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
sudo bash cuda_*_linux-run --override --silent --toolkit
rm -rf cuda_*_linux

echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bash_profile
echo 'export CUDA_HOME=/usr/local/cuda:$PATH' >> ~/.bash_profile
