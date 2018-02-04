#!/bin/bash

# Based on: https://www.tensorflow.org/install/install_linux
# Based on: http://docs.nvidia.com/cuda/cuda-installation-guide-linux
# Download from: https://developer.nvidia.com/cuda-downloads

# CUDA Toolkit
wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_387.26_linux
sudo bash cuda_*_linux --silent --driver --toolkit
rm -rf cuda_*_linux

echo 'export PATH=/usr/local/cuda-9.1/bin:$PATH' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64:$LD_LIBRARY_PATH' >> ~/.bash_profile
echo 'export CUDA_HOME=/usr/local/cuda-9.1:$PATH' >> ~/.bash_profile
