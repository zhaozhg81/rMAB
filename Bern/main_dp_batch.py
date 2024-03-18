import warnings
warnings.filterwarnings("ignore")
from experiments import Experiments
from settings import dist, sys_sep, algo_list, true_prob, sample_size, repeats, gap, gd_eps, random_choice 




lin = False
lin_t = False
lin_const = len(true_prob)

dp = True
#dp_eps_list = range(100,250,50)
dp_eps_list = [180,200]


random_choice="water_filling"
#np.random.seed(1)
for dp_eps in dp_eps_list:
    for algo in algo_list:
        experiments = Experiments(dist = dist, sys_sep = sys_sep, algo=algo, lin = lin, random_choice=random_choice,
                               true_prob = true_prob, sample_size = sample_size, repeats = repeats, gap = gap, gd_eps=gd_eps,
                               lin_t=lin_t, lin_const=lin_const,dp=dp, dp_eps=dp_eps)
        experiments.set_path()
        experiments.total_outputs()



