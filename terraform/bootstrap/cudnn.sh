#!/bin/bash

# Based on: https://www.tensorflow.org/install/install_linux#tensorflow_gpu_support
# Based on: https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html

# Locally
# Download CuDNN 7.1.4 for Cuda 9.0 (tensorflow 1.9) from (needs an account): https://developer.nvidia.com/cudnn
# Move the file to the instance
scp -i $KEYPAIR ~/Downloads/cudnn-9.2-linux-x64-v7.1.tgz ubuntu@gpu:.

# On the instance
tar -xzvf cudnn-*-linux-x64-*.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64

rm -rf cudnn-*-linux-x64-*.tgz
rm -rf cuda
