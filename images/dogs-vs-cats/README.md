# kaggle dogs-vs-cats

Notebooks for [Kaggle dogs vs cats redux](https://www.kaggle.com/c/dogs-vs-cats-redux-kernels-edition)

Utils
1. `data.ipynb`: Download and organize data
1. `submission.py`: Utilities to generate a submission

Models (more or less from basic to advanced and worst to best):
1. `vgg16-retrain.ipynb`: Shows how simple is to reuse and existing model from keras to get a model up and running'
1. `vgg16-simple.ipynb`: Improves on 1 to make a more decent model that does better on the problem
1. `vgg16-simple-multiple-epochs.ipynb`: Same as 2 but runs multiple epochs
1. `resnet50-simple`: Uses resnet50 instead of vgg16 and data augmentation
