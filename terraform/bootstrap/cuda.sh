#!/bin/bash

# Based on: https://www.tensorflow.org/install/install_linux#tensorflow_gpu_support
# Based on: https://docs.nvidia.com/cuda/cuda-installation-guide-linux
# Download from: https://developer.nvidia.com/cuda-downloads

# CUDA Toolkit
wget https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux
sudo bash cuda_*_linux --silent --driver --toolkit
rm -rf cuda_*_linux

echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bash_profile
echo 'export CUDA_HOME=/usr/local/cuda:$PATH' >> ~/.bash_profile
