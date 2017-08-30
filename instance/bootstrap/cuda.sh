#!/bin/bash

# CUDA Toolkit
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
sudo bash cuda_*_linux-run --silent --driver --toolkit
rm -rf cuda_*_linux-run

echo 'export PATH=/usr/local/cuda-8.0/bin:$PATH' >> ~/.bash_profile
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH' >> ~/.bash_profile
echo 'export CUDA_HOME=/usr/local/cuda-8.0:$PATH' >> ~/.bash_profile
