# rMAB algorithm
This repository contains the rMAB algorithm used in the paper titled "Bias, Regret, and Statistical Inference in Adaptive Data Collection" by Zhigen Zhao, Tong Wang, and Bo Ji.

For more details, please refer to the archive website.

The code, tested on Python3, requires Numpy, Scipy, and Pandas libraries.

Please note that the repository includes experiment scenarios for both Bernoulli and Normal distributions. To run the code, navigate to the corresponding folder. The algorithms available here are the standard MAB (main_original.py), rMAB (main_linear_const.py), and the DP method (main_dp_batch.py).

You can find the final results, including the true mean, estimation, bias, and number of pulls for each arm, in total_to.csv.

Additionally, experiments_regret.csv provides the regret at different times, with the time gap specified by the gap parameter in setting.py.

Please be aware that experiments_regrets.csv not only saves regret but also includes bias for different steps. While the bias in this file may not match exactly with total_ot.csv, it is very close as it originates from a separate round of calculations aimed at determining regret with varying sample sizes.

####################################################################
Run main functions directly:

python main_original.py %% standard MAB

python main_linear_const.py %% rMAB algorithm

python main_dp_batch.py %% DP method

####################################################################
Users have the flexibility to customize parameters according to their specific interests in setting.py.

# setting.py
sample_size: The total experiment time.

boot_number: The number of sampling times used in bootstrap.

repeats: The number of repeated experiments.

dist: Distribution type; 'norm' for normally distributed responses, 'bern' for Bernoulli distributed responses.

random_choice: Choice between 'uniform' or 'water_filling' for random selection.

true_prob: A list containing the true probability for each arm for Bernoulli variables or the mean parameters for normal variables.

scale_number: Multiplier used to easily re-scale the true_prob.

sigma: Sigma value used in normal distribution settings.

gap: Time gap used in obtaining regret trend by time.

algo_list: List specifying algorithms explored in the experiment. Full lists include ["greedy", "lil_ucb", "ts", "t_greedy"] for normally distributed responses and ["greedy", "ucb", "ts", "t_greedy"] for Bernoulli distributed responses.

## Summarize the numerical results
Once the experiments have been completed, you can summarize the results using the R code located in the R subdirectory:

summarize.R
