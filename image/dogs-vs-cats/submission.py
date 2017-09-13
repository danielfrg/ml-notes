import numpy as np
import pandas as pd

from tensorflow.contrib.keras.python.keras.preprocessing import image

test_path = './data/test'


def get_batches(dirpath, gen=image.ImageDataGenerator(), shuffle=True, batch_size=64, class_mode='categorical'):
    return gen.flow_from_directory(dirpath, target_size=(224, 224), class_mode=class_mode, shuffle=shuffle, batch_size=batch_size)


def test_batches(test_path="./data/test"):
    """
    Note: There is 12500 test images so we use batch_size of 50 so we dont get extra images
    
    Returns:
        (batches, steps)
    """
    batch_size = 50
    batches = get_batches(test_path, shuffle=False, batch_size=batch_size, class_mode=None)
    steps = batches.samples // batch_size
    return batches, steps


def gen_file(preds, batches, name='sub.csv', clip=False, clip_range=(0.02, 0.98)):
    sub = pd.read_csv('./data/sample_submission.csv')
    
    filenames = batches.filenames
    # filenames are like: 'unknown/#####.jpg'
    ids = np.array([int(f[8:f.find('.')]) for f in filenames])
    sub.id = ids
    
    isdog = preds[:, 1]
    if clip:
        isdog = np.clip(isdog, clip_range[0], clip_range[1])
    sub.label = isdog
    
    sub.to_csv(name, index=None)

