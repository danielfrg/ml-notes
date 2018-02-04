Terraform and bash scripts to create and bootstrap AWS P2 instances with GPU support.

Fill the `local.tf` and then `terraform apply`.

## AWS P2 Instance bootstrap

### AMI

It's usually a good idea to build an AMI from after bootstrap steps.

Notes:
- Build the AMI with small root drive (50GB)

### Scripts

Execute:

- `base.sh`
- `anaconda.sh`

### NVIDIA, Cuda, cuddn

Based on the [official docs](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#install-nvidia-driver).

Execute:
- `nvidia1.sh` - this will reboot the instance
- `nvidia2.sh` - this will reboot the instance
- `nvidia3.sh`
- `cuda.sh` - Cuda Toolkit 8.0
- `cudnn.sh` - This requires to create an account, download a file locally and upload to the instance
- `cuda-prof-tools.sh`

## Env variables

After everything is installed use this to target the cuda libraries.

```
export PATH=/opt/anaconda/conda/bin:$PATH
export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-8.0:$PATH
```
