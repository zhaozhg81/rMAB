import warnings
warnings.filterwarnings("ignore")
from experiments import Experiments
from settings import dist, sys_sep, algo_list, true_prob, sample_size, repeats, gap, gd_eps, random_choice 


lin = False
#lin_t=T means: linear_const
#lin_t=F means: linear
lin_t = False
lin_const = len(true_prob)
dp = False 
dp_eps = 150

random_choice="water_filling"

for algo in algo_list:
	experiments = Experiments(dist = dist, sys_sep = sys_sep, algo=algo, lin = lin, random_choice=random_choice,
	true_prob = true_prob, sample_size = sample_size, repeats = repeats, gap = gap, gd_eps=gd_eps,
	lin_t=lin_t, lin_const=lin_const,dp=dp, dp_eps=dp_eps)
	experiments.set_path()
	experiments.total_outputs()



