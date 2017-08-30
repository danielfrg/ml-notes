# Instance bootstrap

## AMI

It's usually a good idea to build an AMI from after bootstrap steps.

Notes:
- Build the AMI with small root drive (50GB)

## Scripts

Execute:

- `base.sh`
- `anaconda.sh`

### NVIDIA driver

Based on the [official docs](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#install-nvidia-driver).

Execute:
- `nvidia1.sh` - this will reboot the instance
- `nvidia2.sh` - this will reboot the instance
- `nvidia3.sh`
- `cuda-toolkit.sh`
- `cudnn.sh`  - this requires to create an account, download a file locally and upload to the instance
- `cuda-prof-tools.sh`
