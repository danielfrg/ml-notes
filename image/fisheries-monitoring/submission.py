import numpy as np
import pandas as pd

from tensorflow.contrib.keras.python.keras.preprocessing import image


def get_batches(dirpath, gen=image.ImageDataGenerator(), shuffle=True, batch_size=64, class_mode='categorical'):
    return gen.flow_from_directory(dirpath, target_size=(224, 224), class_mode=class_mode, shuffle=shuffle, batch_size=batch_size)


def test_batches(test_path="./data/test_stg1"):
    """
    Note: There is 1000 test images so we use batch_size of 50 so we dont get extra images
    
    Returns:
        (batches, steps)
    """
    batch_size = 50
    batches = get_batches(test_path, shuffle=False, batch_size=batch_size, class_mode=None)
    steps = batches.samples // batch_size
    return batches, steps


def gen_sub_df(preds, filenames, clip=False, clip_range=(0.02, 0.98)):
    df = pd.read_csv('./data/sample_submission_stg2.csv')
    df.image = filenames
    
    # Got this from the train_batches.class_indices
    lbl_indices = {'ALB': 0, 'BET': 1, 'DOL': 2, 'LAG': 3, 'NoF': 4, 'OTHER': 5, 'SHARK': 6, 'YFT': 7}
    
    for lbl, idx in lbl_indices.items():
        df[lbl] = preds[:, idx]
        if clip:
            df[lbl] = np.clip(preds[:, idx], clip_range[0], clip_range[1])
    return df


def gen_file(name='sub.csv', *args, **kwargs):
    df = gen_sub_df(*args, **kwargs)
    df.to_csv(name, index=None)

