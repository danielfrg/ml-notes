#!/bin/bash

# Test that driver is ok
sudo nvidia-smi

# Performance for p2 instances
# Based on: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/optimize_gpu.html
sudo nvidia-persistenced
sudo nvidia-smi --auto-boost-default=0
sudo nvidia-smi -ac 2505,875

sudo reboot
