import torch
import os
import random
import numpy as np
import re
from pprint import pprint
import torch.distributed as dist
from collections import OrderedDict

class RunningAverage():
  def __init__(self):
    self.count = 0
    self.sum = 0

  def update(self, value, n_items = 1):
    self.sum += value
    self.count += n_items

  def __call__(self):
    return self.sum/(self.count + 1e-11)

def set_seed(seed, non_deterministic=False):
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)
        if not non_deterministic:
            torch.backends.cudnn.deterministic = True
            torch.backends.cudnn.benchmark = False
        else:
            torch.backends.cudnn.deterministic = False
            torch.backends.cudnn.benchmark = True
    os.environ["PYTHONHASHSEED"] = str(seed)  

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    '''
    alist.sort(key=natural_keys) sorts in human order
    http://nedbatchelder.com/blog/200712/human_sorting.html
    (See Toothy's implementation in the comments)
    '''
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

class DummyLogger:
  def log(*args, **kwargs):
    pass
  def Image(*args, **kwargs):
    pass