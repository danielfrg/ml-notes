#!/bin/bash

sudo mkdir -p /opt/anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.0.1-Linux-x86_64.sh
bash Anaconda*.sh -b -p /opt/anaconda
rm Anaconda*.sh
sudo chown -R ubuntu:ubuntu /opt/anaconda

echo 'export PATH=/opt/anaconda/bin:$PATH' >> ~/.bash_profile

# Extra libraries
/opt/anaconda/bin/conda config --add channels conda-forge
/opt/anaconda/bin/conda install -y jupyterlab
/opt/anaconda/bin/pip install --upgrade tensorflow-gpu keras
