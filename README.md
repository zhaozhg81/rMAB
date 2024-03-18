# rMAB algorithm
This is the repository for the rMAB algorithm used in paper "Bias, Regret and Statistical Inference in Adaptive Data Collection" by Zhigen Zhao, Tong Wang, and Bo Ji.

Details see (archive website)

Code tested on Python3 requires Numpy, Scipy, and Pandas.

Note that Bernoulli and Normal distributed experiment scenarios are provided, please go to the corresponding folder to run. Algorithms here includes standard MAB(main_original.py), rMAB(main_linear_const.py) and DP method(main_dp_batch.py). 

See total_to.csv to get the final results including true mean, estimation, bias and number of pulls for each arm.

See experiments_regret.csv to get regret by differnt time in the last column. The time gap could be specified by gap in setting.py.


(Please note that 'experiments_regrets.csv' saves not only regret, but also the bias for diffent steps. The bias here is not exactly same in the file 'total_ot.csv', but pretty close, because they come from another round calculation aiming for regret with different sample size.)

####################################################################
Run main functions directly:

main_original.py (standard MAB)
main_linear_const.py (rMAB algorithms)
main_dp_batch.py (DP method, users can modify dp_eplison described in DP method's paper "Seth Neel and Aaron Roth. Mitigating Bias in Adaptive Data Gathering via Differential Privacy." )

python main_original.py
python main_linear_const.py
python main_dp_batch.py

####################################################################
Users can customize parameters per their own interests in setting.py.

# setting.py
sample size  :   The total experimemt time.
boot_number  :   The sampling times used in bootstrap.  
repeats      :   The number of repeated experiments.
dist         :   Distribution type 'norm' for normally distributed responses,
	         while 'bern' for bernoulli distributed responses. 
random_choice:   Either 'uniform' or 'water_filling'.
true_prob    :   A list including the true probability for each arm for bernoulli variables, while the mean parameters for normalvariables. 
scale_number :   Multiplier used to re-scale the true_prob easily.
sigma        :   Sigma used in normal distribution setting
gap          :   Time gap used in obtaining regret trend by time
algo_list    :   List specifying algorithms explored in experiment. 
		 Full list includes ["greedy","lil_ucb","ts","t_greedy"] for normal distributed responses, and ["greedy","ucb","ts","t_greedy"] for bernoulli distributed responses. 

## Summarize the numerical results
after finishing running of the experiments, one can summarize the result using the R code from the R subdirectory:

summarize.R
