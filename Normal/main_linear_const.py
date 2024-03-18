from experiments import Experiments
from settings import dist,sys_sep, true_mean,scale_number,sigma,sample_size,repeats,gap,algo_list

#lin & dp are bool variTables 
#lin & dp are mutual exclusive
lin = False
#lin_t=T means: linear
#lin_t=F means: linear_const
lin_t = True
lin_const = len(true_mean)
dp = False 
dp_eps = 150

gd_eps = 0.1
lil_delta = 0.005
lil_beta = 1
lil_eps = 0.01
lil_lambda = 9
rc_list = ["water_filling","uniform"]


for random_choice in rc_list:
    for algo in algo_list:
        eriments = Experiments(dist = dist, sys_sep = sys_sep, algo=algo, lin = lin, lin_t = lin_t, 
			lin_const = lin_const,random_choice=random_choice, true_mean = true_mean, sample_size = sample_size, 
            repeats = repeats, gap = gap, gd_eps=gd_eps, sigma = sigma,	 
            lil_delta = lil_delta, lil_eps = lil_eps, lil_lambda = lil_lambda, lil_beta = lil_beta,
            dp = dp, dp_eps = dp_eps)
        
        eriments.set_path()
        eriments.total_outputs()



