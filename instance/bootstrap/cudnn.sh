#!/bin/bash

# Locally: Download CuDNN (needs an account) from:
# https://developer.nvidia.com/cudnn
# Move the file to the instance
scp -i ~/.ssh/<keypair> ~/Downloads/cudnn-7.5-linux-x64-v5.1 ubuntu@gpu:.

# On the instance:
tar -xzvf cudnn-*-linux-x64-*.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h

rm -rf cudnn-*-linux-x64-*.tgz
rm -rf cuda
