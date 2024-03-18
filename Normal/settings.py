######parameter settings for the family of main functions ##########
import pandas as pd
from sys import platform

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





random_choice = "water_filling"
# random_choice = "uniform"


dist = "norm"
true_mean = [1,0.75,0.5,0.375,0.25]
## true_mean = [1, 0.5]

##dist = "bern"
##true_prob = [1.8, 1.4, 1.0, 0.6, 0.2]


scale_number = 1
s = pd.Series(true_mean)
true_mean = (s * scale_number).tolist()
sigma = 1

if len(true_mean)==2:
	infer_bool = True 
else:
	infer_bool = False



gap = 1


algo_list = ["greedy","lil_ucb","ts","t_greedy"]
## algo_list = ["greedy","ucb","ts","t_greedy"]

## algo_list = ["ucb"]
