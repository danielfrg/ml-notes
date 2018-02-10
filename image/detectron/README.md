
An example on using detectron programatically

## Install

Install

```
sudo apt install -y libsm6 libxext6 libfontconfig1 libxrender1
```


Conda env uses a prebuilt caffe2 conda pkg built with cuda 9.1, cudnn 7 and Ubuntu 16.04 but will probably not work in other machines.

```
conda env create
conda activate using-detectron
```

Install COCOAPI:

```
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI

python setup.py install
```

Install Detectron (right not requires [this patch](https://github.com/facebookresearch/Detectron/pull/112)):

```
git clone https://github.com/facebookresearch/detectron
cd detectron

cd lib && make

# Test: Should run and return OK
python ./tests/test_spatial_narrow_as_op.py
```
