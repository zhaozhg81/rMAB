from os import path
from mab import Bandits
import os
import numpy as np
import pandas as pd
#import scipy.stats as stats
from math import sqrt
#from scipy.stats import t
from scipy.stats import norm,t
from numpy.linalg import matrix_rank

class Experiments():
    def __init__(self, dist, sys_sep, algo, lin, lin_t, lin_const, random_choice,true_mean, sample_size, repeats, gap, gd_eps, sigma, lil_delta, lil_eps, lil_lambda, lil_beta, dp, dp_eps):
        self.random_choice = random_choice
        self.algo = algo
        self.lin = lin
        self.lin_t = lin_t
        self.lin_const = lin_const
        self.repeats = repeats
        self.dist = dist
        self.sys_sep = sys_sep
        self.true_mean = true_mean
        self.sample_size = sample_size
        self.gap = gap
        self.bandit_num = len(true_mean)
        self.gd_eps = gd_eps
        self.sigma = sigma
        self.lil_delta = lil_delta
        self.lil_eps = lil_eps
        self.lil_lambda = lil_lambda
        self.lil_beta = lil_beta
        self.dp = dp
        self.dp_eps = dp_eps

    def set_path(self):
        cwdname = os.getcwd()
        if self.dp:
            folder = cwdname + self.sys_sep + "result" + self.sys_sep + self.dist + self.sys_sep + str(self.sample_size) + self.sys_sep +"Arm_" + str( len(self.true_mean) ) + self.sys_sep + self.random_choice + self.sys_sep + "experiments_"+ self.algo + "_dp" + str(self.dp_eps) + "_" + self.dist
        elif self.lin:
            folder = cwdname + self.sys_sep + "result" + self.sys_sep+ self.dist + self.sys_sep + str(self.sample_size)  + self.sys_sep +"Arm_" + str( len(self.true_mean) ) + self.sys_sep + self.random_choice + self.sys_sep + "experiments_"+ self.algo + "_linear"+"_" + self.dist
        elif self.lin_t:
            folder = cwdname + self.sys_sep + "result" + self.sys_sep+ self.dist + self.sys_sep + str(self.sample_size)  + self.sys_sep +"Arm_" + str( len(self.true_mean) ) + self.sys_sep + self.random_choice + self.sys_sep + "experiments_"+ self.algo + "_linear_const"+"_" + self.dist
        else:
            folder = cwdname + self.sys_sep + "result" + self.sys_sep+ self.dist + self.sys_sep + str(self.sample_size)  + self.sys_sep +"Arm_" + str( len(self.true_mean) ) + self.sys_sep + self.random_choice + self.sys_sep + "experiments_"+ self.algo + "_original"+"_" + self.dist

        if path.exists(folder)!= 1:
            #os.mkdir(folder)
            os.makedirs(folder)
        self.folder = folder

    def run_experiments(self):
        #for the storage of output of single experiment, which involves the result of each step
        #it is the first output of mab algo 
        mix_dict_bias = dict.fromkeys((range(self.repeats)))
        mix_dict_means = dict.fromkeys((range(self.repeats)))
        mix_dict_variance = dict.fromkeys((range(self.repeats)))

        mix_dict_pulls = dict.fromkeys((range(self.repeats)))
        mix_dict_pulls2 = dict.fromkeys((range(self.repeats)))

        mix_dict_cov = dict.fromkeys((range(self.repeats)))
        mix_dict_corr = dict.fromkeys((range(self.repeats)))
        mix_dict_exp_bias = dict.fromkeys((range(self.repeats)))
        mix_dict_sd = np.zeros((self.repeats,self.bandit_num))
        mix_dict_upper = np.zeros((self.repeats,self.bandit_num))
        mix_dict_lower = np.zeros((self.repeats,self.bandit_num))
        mix_dict_mean2 = np.zeros((self.repeats,self.bandit_num))
        mix_dict_ci_mark = np.zeros((self.repeats,self.bandit_num))
        #two sample t-test pvalue storage
        mix_dict_p_mark1 = np.zeros(self.repeats)
        #one sample t-test pvalue storage
        mix_dict_p_mark2 = np.zeros((self.repeats,self.bandit_num))


        mix_dict_var = np.zeros((self.repeats,self.bandit_num))
        #mix_dict_z = np.zeros((self.repeats,self.bandit_num))
        mix_dict_z2 = np.zeros((self.repeats,self.bandit_num))
        mix_dict_t = np.zeros(self.repeats)
        mix_dict_df_upper = np.zeros(self.repeats)
        mix_dict_df_lower = np.zeros(self.repeats)
        mix_dict_df_ci_mark = np.zeros(self.repeats)
        mix_design_mat_rank = np.zeros(self.repeats)
        #for the storage of bandit_stats of single experiment, which involves the final result of each arm
        #it is the second output of mab algo
        mix_dict2 = dict.fromkeys((range(self.repeats)))


        for j in range(self.repeats):
            bandits = Bandits(random_choice = self.random_choice, true_mean=self.true_mean,
                              sample_size=self.sample_size, algo = self.algo, 
                              lin = self.lin, lin_t = self.lin_t, lin_const = self.lin_const,
                              gd_eps=self.gd_eps, sigma = self.sigma, 
                              lil_delta = self.lil_delta, lil_eps = self.lil_eps, 
                              lil_lambda = self.lil_lambda, lil_beta = self.lil_beta,
                              dp = self.dp, dp_eps = self.dp_eps)
            
            (bandit_stats, output_bias, output_means, output_variance, output_pulls, output_cov, output_corr, 
             output_reward, output_pull_indicator) = bandits.run()
            
            #data_ot = pd.DataFrame(output_bias)
            #data_ot.to_csv(self.folder + self.sys_sep + str(self.sample_size) + '_' + str(j) + ".csv")
            #data_ot = pd.DataFrame(output_means)
            #data_ot.to_csv(self.folder + self.sys_sep + str(self.sample_size) + '_' + str(j) + ".csv")
            mix_design_mat_rank[j] = matrix_rank(output_pull_indicator)
            mix_dict_bias[j] = output_bias
            mix_dict_means[j] = output_means
            mix_dict_variance[j] = bandit_stats['variance']
            mix_dict_pulls[j] = output_pulls
            mix_dict_pulls2[j] = bandit_stats['pulls']
            
            mix_dict_cov[j] = output_cov
            mix_dict_corr[j] = output_corr
            mix_dict_sd[j,] = np.nanstd(output_reward,axis=0)
            mix_dict_mean2[j,] = np.nanmean(output_reward, axis=0)
            #mix_dict_pulls2[j,] = np.nansum(output_reward, axis=0)
            #mix_dict_lower[j,] = mix_dict_mean2[j,]-1.96*mix_dict_sd[j,]/sqrt(self.sample_size)
            #mix_dict_upper[j,] = mix_dict_mean2[j,]+1.96*mix_dict_sd[j,]/sqrt(self.sample_size)
            mix_dict_var[j,] = np.nanvar(output_reward,axis=0)
            mix_dict2[j] = bandit_stats
            cutoff = 0.05

        a=np.array(list(mix_dict2.values()))
        return mix_dict_bias, mix_dict_means, mix_dict_variance, mix_dict_pulls,mix_dict_pulls2, mix_dict_cov, mix_dict_corr, a, mix_dict_upper, mix_dict_lower, mix_dict_mean2, mix_dict_ci_mark, mix_dict_p_mark1,mix_dict_p_mark2, mix_dict_var, mix_dict_z2, mix_dict_t, mix_dict_df_ci_mark, mix_design_mat_rank

    def compute_total_stats(self):
        (mix_dict_bias, mix_dict_means, mix_dict_variance,  mix_dict_pulls,mix_dict_pulls2, mix_dict_cov,mix_dict_corr, a, mix_dict_upper, mix_dict_lower, mix_dict_mean2, mix_dict_ci_mark, mix_dict_p_mark1,mix_dict_p_mark2, mix_dict_var, mix_dict_z2, mix_dict_t, mix_dict_df_ci_mark, mix_design_mat_rank) = self.run_experiments()
        total_stats = np.zeros((self.bandit_num,), dtype=[('true_means',float),
                                                   ('means', float),
                                                   ('bias', float),
                                                   ('total_rewards', float),
                                                   ('pulls', float),
                                                   ('std_means', float)])
        total_stats['total_rewards'] = np.mean(a['total_rewards'], axis=0)
        total_stats['pulls'] = np.mean(a['pulls'], axis=0)
        total_stats['means'] = np.mean(a['means'], axis=0)
        total_stats['bias'] = np.mean(a['bias'],axis=0)
        total_stats['std_means'] = np.std(a['means'], axis=0)
        total_stats['true_means'] = self.true_mean


        return mix_dict_bias, mix_dict_means, mix_dict_variance, mix_dict_pulls,mix_dict_pulls2, mix_dict_cov, mix_dict_corr, total_stats, mix_dict_mean2, mix_dict_ci_mark,mix_dict_var, mix_dict_z2, mix_dict_t, mix_dict_lower, mix_dict_upper, mix_dict_df_ci_mark, mix_design_mat_rank


    def total_outputs(self):
        (mix_dict_bias, mix_dict_means, mix_dict_variance, mix_dict_pulls,mix_dict_pulls2, mix_dict_cov, mix_dict_corr, total_stats, mix_dict_mean2, mix_dict_ci_mark,mix_dict_var, mix_dict_z2, mix_dict_t, mix_dict_lower, mix_dict_upper, mix_dict_df_ci_mark,mix_design_mat_rank) = self.compute_total_stats()
        
        sizelist = range(0, self.sample_size, self.gap)
        ##avg_output
        #1st col: avg bias for arm1 sorted by t/gap
        #2nd col: avg bias for arm2 sorted by t/gap
        #For out_put_bias, additional col used to save regret
        avg_output_bias = np.zeros((len(sizelist), self.bandit_num+1))
        avg_output_cov = np.zeros((len(sizelist), self.bandit_num))
        avg_output_corr = np.zeros((len(sizelist), self.bandit_num))
        avg_output_pulls = np.zeros((len(sizelist), self.bandit_num))
        avg_output_exp_bias = np.zeros((len(sizelist), self.bandit_num))
        
        
        ## The variable to store the result from the last time point for statsitical inference
        last_output_bias = np.zeros( ( self.repeats, self.bandit_num+1) )
        last_output_variance = np.zeros(( self.repeats, self.bandit_num) )
        last_output_pulls = np.zeros(( self.repeats, self.bandit_num) )
        
        ## Calculate the statistics based on the last iteration for further inference.
        for ii in range(self.repeats):
            for k in range(self.bandit_num+1):
                last_output_bias[ii][k] = mix_dict_bias.get(ii)[self.sample_size-1][k]
            for k in range(self.bandit_num):
                last_output_variance[ii][k] = mix_dict_variance.get(ii)[k]
                last_output_pulls[ii][k] = mix_dict_pulls.get(ii)[self.sample_size-1][k]
        
        # calcuate fpr regret related by different steps to get trend plot
        s0 = 0
        for s in sizelist:
            s_bias_mat = np.zeros((self.repeats,self.bandit_num+1))
            s_corr_mat = np.zeros((self.repeats,self.bandit_num))
            s_cov_mat = np.zeros((self.repeats,self.bandit_num))
            s_pulls_mat = np.zeros((self.repeats,self.bandit_num))

            for j in range(self.repeats):
                for k in range(self.bandit_num+1):
                    # for bias and regret only
                    s_bias_mat[j][k] = mix_dict_bias.get(j)[s][k]
                for k in range(self.bandit_num):
                    s_corr_mat[j][k] = mix_dict_corr.get(j)[s][k]
                    s_cov_mat[j][k] = mix_dict_cov.get(j)[s][k]
                    s_pulls_mat[j][k] = mix_dict_pulls.get(j)[s][k]

            avg_output_bias[s0] = np.average(s_bias_mat, axis=0)
            avg_output_cov[s0] = np.average(s_cov_mat, axis=0)
            avg_output_corr[s0] = np.average(s_corr_mat, axis=0)
            avg_output_pulls[s0] = np.average(s_pulls_mat, axis=0)
            avg_output_exp_bias[s0] = -avg_output_cov[s0]/( avg_output_pulls[s0] + (avg_output_pulls[s0]==0) )
            s0 = s0 + 1
            
        # Please note that 'experiments_regrets.csv' saves not only regret,
        # but also the bias at each step.
        # The bias here is not exactly same in the file 'total_ot.csv', but pretty close,
        # because they come from another round calculation aiming for regret at different size.
        avg_output_ot_bias = pd.DataFrame(avg_output_bias)
        avg_output_ot_bias.to_csv(self.folder + self.sys_sep + "experiments_regret" + ".csv")

        total_stats_ot = pd.DataFrame(total_stats)
        total_stats_ot.to_csv(self.folder + self.sys_sep + "total" + "_ot" + ".csv")
        
        last_output_ot_bias = pd.DataFrame( last_output_bias )
        last_output_ot_bias.to_csv(self.folder + self.sys_sep + "bias_all" + ".csv")
        
        last_output_ot_variance = pd.DataFrame( last_output_variance )
        last_output_ot_variance.to_csv(self.folder + self.sys_sep + "variance_all" + ".csv")
        
        last_output_ot_pulls = pd.DataFrame( last_output_pulls )
        last_output_ot_pulls.to_csv(self.folder + self.sys_sep + "pulls_all" + ".csv")

        #mix_design_mat_rank_ot = pd.DataFrame(mix_design_mat_rank)
        #mix_design_mat_rank_ot.to_csv(self.folder + self.sys_sep + "mix_design_mat_rank" + "_ot" + ".csv")

