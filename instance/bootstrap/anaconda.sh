#!/bin/bash

sudo mkdir -p /opt/anaconda
sudo chown ubuntu:ubuntu /opt/anaconda
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
bash Anaconda*.sh -b -p /opt/anaconda/conda
rm Anaconda*

echo 'export PATH=/opt/anaconda/conda/bin:$PATH' >> ~/.bash_profile

# Extra libraries
/opt/anaconda/conda/bin/conda config --add channels conda-forge
/opt/anaconda/conda/bin/pip install --upgrade tensorflow-gpu
/opt/anaconda/conda/bin/conda install -y keras jupyterlab
