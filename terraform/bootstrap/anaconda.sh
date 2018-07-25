#!/bin/bash

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda*.sh -b -p /opt/anaconda/conda
sudo chown -R ubuntu:ubuntu /opt/anaconda
rm Miniconda*.sh

echo 'export PATH=/opt/anaconda/bin:$PATH' >> ~/.bash_profile

# Extra libraries
/opt/anaconda/bin/conda config --add channels conda-forge
/opt/anaconda/bin/conda install -y jupyterlab
/opt/anaconda/bin/pip install --upgrade tensorflow-gpu keras
