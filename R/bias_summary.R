
ucb.orig = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original","_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
rucb.unif = read.csv( paste( file_prefix, "uniform/experiments_lil_ucb_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]
rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]

greedy.orig = read.csv( paste(file_prefix, "water_filling/experiments_greedy_original","_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_greedy_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
rgreedy.unif = read.csv( paste( file_prefix, "uniform/experiments_greedy_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]
rgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_greedy_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]

tgreedy.orig = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_original","_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
tgreedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
rtgreedy.unif = read.csv( paste( file_prefix, "uniform/experiments_t_greedy_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]
rtgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]

ts.orig = read.csv( paste(file_prefix, "water_filling/experiments_ts_original","_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
ts.dp = read.csv( paste(file_prefix, "water_filling/experiments_ts_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[sample,2:(K+2)]
rts.unif = read.csv( paste( file_prefix, "uniform/experiments_ts_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]
rts.wf = read.csv( paste(file_prefix, "water_filling/experiments_ts_linear_const","_",rewards_dist2,"/experiments_regret.csv", sep="") )[sample,2:(K+2)]

bias.summary = data.frame( ucb.orig=t(ucb.orig), ucb.dp = t(ucb.dp), rucb.unif=t(rucb.unif), rucb.wf=t(rucb.wf), greedy.orig= t(greedy.orig), greedy.dp = t(greedy.dp), rgreedy.unif=t(rgreedy.unif), rgreedy.wf=t(rgreedy.wf),
                           tgreedy.orig= t(tgreedy.orig), tgreedy.dp = t(tgreedy.dp), rtgreedy.unif=t(rtgreedy.unif), rtgreedy.wf=t(rtgreedy.wf), ts.orig= t(ts.orig), ts.dp = t(ts.dp), rts.unif=t(rts.unif), rts.wf=t(rts.wf) )
colnames(bias.summary)= c("ucb.orig","ucb.dp","rucb.unif","rucb.wf", "greedy.orig", "greedy.dp","rgreedy.unif","rgreedy.wf", "tgreedy.orig", "tgreedy.dp", "rtgreedy.unif", "rtgreedy.wf","ts.orig", "ts.dp", "rts.unif", "rts.wf")
bias.summary = round(bias.summary, digits=3)