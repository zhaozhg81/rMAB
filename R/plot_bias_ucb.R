ucb.orig = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
rucb.unif = read.csv( paste( file_prefix, "uniform/experiments_lil_ucb_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]
rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]


filename=paste("../figure/bias_UCB_",rewards_dist,"_n_",sample,"_arms_",K, sep="")

CEX=2.5
LWD=3
par(mfrow=c(1,K))
for(arm in 1:K)
{
  ylimits= c( min( c(ucb.orig[1:sample, arm], ucb.dp[1:sample, arm], rucb.unif[1:sample, arm], rucb.wf[1:sample, arm]) )*1.05,  max( c(ucb.orig[1:sample, arm], ucb.dp[1:sample, arm], rucb.unif[1:sample, arm], rucb.wf[1:sample, arm]) )*1.05) 
  plot( c(1:sample), ucb.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="", ylim= ylimits, 
        cex.main=CEX, cex.lab=CEX )
  points( c(1:sample), ucb.dp[,arm], 'l', lty=2, col='blue', lwd=LWD)
  points( c(1:sample), rucb.unif[,arm], 'l', lty=3, col='green', lwd=LWD)
  points( c(1:sample), rucb.wf[,arm], 'l', lty=4, col='red', lwd=LWD)
}