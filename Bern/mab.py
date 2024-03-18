from __future__ import division
import numpy as np
#import matplotlib.pyplot as plt
import pandas as pd
import math
import scipy.stats as stats
from math import log, ceil, sqrt, inf
from numpy.random import choice

def lambda_t1(t):
    y=log(t)/t
    return y

def lambda_t2(t):
    y=1.0/log(t)
    return y        

def lambda_t3(t):
    y=1.0/t
    return y

def random_select(n):
	selected = choice(range(n), 1, p=np.repeat(1/n, n))[0]
	return selected


def count_char1(txt):
    result = 0
    for char in txt:
        if char=="1":
            result += 1     
    return result

class Bandits():
    def __init__(self, random_choice, true_prob, sample_size, algo, lin, gd_eps, lin_t, lin_const, dp, dp_eps):
        self.random_choice = random_choice
        self.true_prob = true_prob
        self.bandit_num = len(true_prob)
        self.max_prob = max(true_prob)
        self.sample_size = sample_size
        self.algo = algo
        self.lin = lin
        self.lin_t = lin_t
        self.lin_const = lin_const
        self.gd_eps = gd_eps
        self.dp = dp
        self.dp_eps = dp_eps
        self.bandit_stats = np.zeros((self.bandit_num,), dtype=[('total_rewards', float),
                                                                ('pulls', float), ('means', float), ('variance', float), ('bias', float),
                                                                ('covariance', float),('corr', float)])
        # +1 means the last column is regret
        self.output_bias = np.zeros((self.sample_size, self.bandit_num+1))
        self.output_pulls = np.zeros((self.sample_size, self.bandit_num))
        self.output_cov = np.zeros((self.sample_size, self.bandit_num))
        self.output_means = np.zeros((self.sample_size, self.bandit_num))
        self.output_variance = np.zeros((self.sample_size, self.bandit_num))
        self.output_freq = np.zeros((self.sample_size, self.bandit_num))
        self.output_corr = np.zeros((self.sample_size, self.bandit_num))
        self.output_exp_bias = np.zeros((self.sample_size, self.bandit_num))
        self.output_reward = np.empty((self.sample_size, self.bandit_num))
        self.output_reward[:] = np.NaN
        self.output_pull_indicator = np.zeros((self.sample_size, self.bandit_num))

        if self.bandit_num < 2:
            raise ValueError('Number of bandits should be greater than 1')




    def epsilon_greedy_select(self,t):
        if np.random.binomial(1, self.gd_eps):
            #exploration:
            selected = random_select(self.bandit_num)
        else:
            #exploitation:
            if self.dp:
                selected = (self.bandit_stats['means']+self.dp_noise(t)/self.bandit_stats['pulls']).argmax()
            else:
                selected = self.bandit_stats['means'].argmax()
        return selected

    def t_greedy_select(self,t):
        if np.random.binomial(1, lambda_t3(t)):
            #exploration:
            selected = random_select(self.bandit_num)
        else:
            #exploitation:
            if self.dp:
                selected = (self.bandit_stats['means']+self.dp_noise(t)/self.bandit_stats['pulls']).argmax()
            else:
                selected = self.bandit_stats['means'].argmax()
        return selected

    def greedy_select(self,t):
        if self.dp:
            selected = (self.bandit_stats['means']+self.dp_noise(t)/self.bandit_stats['pulls']).argmax()
        else:
            selected = self.bandit_stats['means'].argmax()		
        return selected

    def ucb_select(self, t): 
        max_upper_bound = 0
        selected = 0
        for k in range(self.bandit_num): 
            delta_k = math.sqrt(2*math.log(t+1)/self.bandit_stats['pulls'][k])
            if self.dp: 
                mean = self.bandit_stats['means'][k]+self.dp_noise(t)/self.bandit_stats['pulls'][k]
            else:
                mean = self.bandit_stats['means'][k]
            upper_bound = mean + delta_k
            if (upper_bound > max_upper_bound):
                max_upper_bound = upper_bound
                selected = k
        return selected

    def ts_select(self, t):
        thetamax = 0
        selected = 0
        for k in range(self.bandit_num): 
            if self.dp: 
                total_rewards = self.bandit_stats['total_rewards'][k] + self.dp_noise(t)
                ts_alpha = 1 + total_rewards
                ts_beta = 1 + self.bandit_stats['pulls'][k] - self.bandit_stats['total_rewards'][k]
                if ts_alpha<0 or ts_beta<0: 
                    ts_alpha = 1 
                    ts_beta = 1 

            else: 
                total_rewards = self.bandit_stats['total_rewards'][k]			
                ts_alpha = 1 + self.bandit_stats['total_rewards'][k]
                ts_beta = 1 + self.bandit_stats['pulls'][k] - self.bandit_stats['total_rewards'][k]
            rnd = np.random.beta(ts_alpha, ts_beta)
            if rnd >= thetamax:
                thetamax = rnd
                selected = k
        return selected

    def mab_select(self, t):
        if self.algo == "ucb": 
            selected = self.ucb_select(t)
        elif self.algo == "lil_ucb": 
            selected = self.ucb_select(t)
        elif self.algo == "ts": 
            selected = self.ts_select(t)
        elif self.algo == "epsilon_greedy": 
            selected = self.epsilon_greedy_select(t)
        elif self.algo == "greedy": 
            selected = self.greedy_select(t)
        elif self.algo == "t_greedy": 
            selected = self.t_greedy_select(t)
        elif self.algo == "equal": 
            selected = random_select(self.bandit_num) 
        return selected

    def select(self, t):
        if self.lin_const > self.bandit_num: 
            raise ValueError('Number of lin_const should be smaller than bandit number')

        if t < self.bandit_num: 
            selected = t 
        else:
            u = np.random.uniform(low=0.0, high=1.0, size=1) 
            if self.lin: 
                lambda_t = lambda_t3(t+1) 
            elif self.lin_t: 
                lambda_t = self.lin_const*lambda_t3(t+1)
            else: 
                lambda_t = 0

            if u < lambda_t: 
                if self.random_choice == "uniform": 
                    selected = random_select(self.bandit_num)
                else: selected = self.bandit_stats['pulls'].argmin()
                #   self.random_choice == "water_filling":
            else: selected = self.mab_select(t)
        return selected


    def update(self, t, selected):
        temp_reward = np.random.binomial(n=1,p=self.true_prob[selected])
        self.output_bias[t] = np.copy(self.output_bias[t-1])
        self.output_means[t] = np.copy(self.output_means[t-1])
        self.output_pulls[t] = np.copy(self.output_pulls[t-1])
        self.output_cov[t] = np.copy(self.output_cov[t-1])
        self.output_corr[t] = np.copy(self.output_corr[t-1])
        #self.output_freq[t] = np.copy(self.output_freq[t-1])*(t/(t+1))
        #self.output_exp_bias[t] = np.copy(self.output_exp_bias[t-1])
        self.output_reward[t][selected] = temp_reward
        self.output_reward[t][selected] = temp_reward
        X_N_bar = self.bandit_stats['means'][selected]
        N_tmp = self.bandit_stats['pulls'][selected]

        #self.bandit_stats = np.copy(self.bandit_stats)
        self.bandit_stats['total_rewards'][selected] = self.bandit_stats['total_rewards'][selected] +  temp_reward
        self.bandit_stats['pulls'][selected] = self.bandit_stats['pulls'][selected] + 1 
        self.bandit_stats['means'][selected] = self.bandit_stats['total_rewards'][selected]/self.bandit_stats['pulls'][selected]
        
        if N_tmp==0:
            self.bandit_stats['variance'][selected] = 0    		
        else:
            self.bandit_stats['variance'][selected] = N_tmp/(N_tmp+1)* ( self.bandit_stats['variance'][selected] + X_N_bar**2 + temp_reward**2/N_tmp ) - self.bandit_stats['means'][selected]**2 

        
        self.bandit_stats['bias'][selected] = self.bandit_stats['means'][selected]-self.true_prob[selected]
        #self.bandit_stats['freq'][selected] = self.bandit_stats['pulls'][selected]/(t+1)
        #self.output[t][selected] = self.bandit_stats['means'][selected] - self.true_prob[selected]

        self.output_bias[t][selected] = self.bandit_stats['means'][selected] - self.true_prob[selected]
        #computation of regret
        self.output_bias[t][self.bandit_num] = -(sum(self.bandit_stats['total_rewards']) - self.max_prob*(t+1))/(t+1)
        self.output_means[t][selected] = self.bandit_stats['means'][selected]
        self.output_pulls[t][selected] = self.bandit_stats['pulls'][selected]
        #self.output_freq[t][selected] = self.bandit_stats['freq'][selected]
        self.output_variance[t][selected] = self.bandit_stats['variance'][selected]

        #computation of cov
        X=np.stack((self.output_means[:,selected][0:t], self.output_pulls[:,selected][0:t]), axis=0)
        #since cov(x,y) can not be computed in python for single point
        if (X.shape[1] <= 1) or (0 in np.var(X,axis=1)): 
            self.bandit_stats['covariance'][selected] = 0
            self.bandit_stats['corr'][selected] = 0
            #self.bandit_stats['freq'][selected] = 0
            #self.bandit_stats['exp_bias'][selected] = 0


        else: 
            corr_mat=np.corrcoef(X, bias=True)
            corr_mat[np.isnan(corr_mat)] = 0
            self.bandit_stats['corr'][selected] = corr_mat[1,0]

            cov_mat=np.cov(X, bias=True)
            cov_mat[np.isnan(cov_mat)] = 0
            #self.output_cov[t][selected] = cov_mat[1,0]
            self.bandit_stats['covariance'][selected] = cov_mat[1,0]
            #self.bandit_stats['exp_bias'][selected] = -self.bandit_stats['covariance'][selected]/np.sum(self.output_freq[:,selected][0:t])

        self.output_corr[t][selected] = self.bandit_stats['corr'][selected]
        self.output_cov[t][selected] = self.bandit_stats['covariance'][selected]


    def run(self):
        for t in range(self.sample_size):
            selected = self.select(t)
            self.update(t, selected)
        return self.bandit_stats, self.output_bias, self.output_means, self.output_variance, self.output_pulls, self.output_cov, self.output_corr, self.output_reward


    def dp_noise(self,t):
        t_bin_cnt=0
        n_digit = int(ceil(log(self.sample_size,2)))
        dp_eps0 = self.dp_eps/self.bandit_num

        #convert t into binary representation
        t_bin=bin(t)[2:].zfill(n_digit)
        t_bin_cnt = count_char1(t_bin)
        sum_lap = np.random.laplace(loc=0.0, scale=t_bin_cnt/dp_eps0)
        return sum_lap









