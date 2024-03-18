######parameter settings for the family of main functions ##########
#import pandas as pd
from sys import platform
import warnings
warnings.filterwarnings('ignore')

if platform == "linux" or platform == "linux2":
	sys_sep = "/"
	# linux
elif platform == "darwin":
	sys_sep = "/"
	# OS X
elif platform == "win32":
	sys_sep = "\\"
#sys_sep = "\\"


sample_size = 10000
boot_number = 2000
repeats = 1000


dist = "bern"

#random_choice = "water_filling"
random_choice = "uniform"


# each element below should be <= 1
## true_prob = [0.8,0.2]
true_prob = [0.9, 0.7, 0.5, 0.3, 0.1]

#scale_number = 0.5
#s = pd.Series(true_prob)
#true_prob = (s * scale_number).tolist()
#sigma = 1

if len(true_prob)==2:
	infer_bool = True 
else:
	infer_bool = False


gap = 1

gd_eps = 0.1


algo_list = ["greedy","lil_ucb","ts","t_greedy"]
## algo_list = ["greedy"]
