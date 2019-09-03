
import os
import sys
from pprint import pprint
from itertools import islice

import seaborn
import numpy as np
import pandas as pd
from tqdm import tqdm
import matplotlib as mpl
import matplotlib.pyplot as plt

print('imported all commonly used libraries by justine')

import readline
import rlcompleter
readline.parse_and_bind('tab: complete')


import atexit
from pathlib import Path
from jc_tools.utils import get_time_id

history_dir = Path('~/.python_history/').expanduser()
history_dir.mkdir(parents=True, exist_ok=True)

history_fp = history_dir / '{}.txt'.format(get_time_id(time_format='%y%m%d_%H%M'))

@atexit.register
def save_history(history_fp=history_fp):
    readline.write_history_file(history_fp)

## TODO super annoying, raises a IsADirectoryError at exit :/ even though it works

del atexit
del rlcompleter
del save_history
del history_dir

