
ucb.orig = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
rucb.unif = read.csv( paste( file_prefix, "uniform/experiments_lil_ucb_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]
rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]

greedy.orig = read.csv( paste(file_prefix, "water_filling/experiments_greedy_original_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_greedy_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
rgreedy.unif = read.csv( paste( file_prefix, "uniform/experiments_greedy_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]
rgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_greedy_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]

tgreedy.orig = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_original_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
tgreedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
rtgreedy.unif = read.csv( paste( file_prefix, "uniform/experiments_t_greedy_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]
rtgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]

ts.orig = read.csv( paste(file_prefix, "water_filling/experiments_ts_original_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
ts.dp = read.csv( paste(file_prefix, "water_filling/experiments_ts_dp",DP,"_",rewards_dist2,"/experiments_regret.csv", sep="")  )[,2:(K+2)]
rts.unif = read.csv( paste( file_prefix, "uniform/experiments_ts_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]
rts.wf = read.csv( paste(file_prefix, "water_filling/experiments_ts_linear_const_",rewards_dist2,"/experiments_regret.csv", sep="") )[,2:(K+2)]


filename=paste("../figure/bias_",rewards_dist,"_n_",sample,"_arms_",K, ".png", sep="")
CEX=2.5
LWD=2


png(filename, width=960, height=960)

par(mfrow=c(4,K), mgp=c(1.75,1,0))
for(arm in 1:K)
{
  ylimits= c( min( c(greedy.orig[1:sample,arm], greedy.dp[1:sample,arm], rgreedy.unif[1:sample,arm], rgreedy.wf[1:sample,arm]) )*1.05,  max( c(greedy.orig[1:sample, arm], greedy.dp[1:sample, arm], rgreedy.unif[1:sample, arm], rgreedy.wf[1:sample, arm]) )*1.05 ) 
  if(arm==1){
    plot( c(1:sample), greedy.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="Greedy", ylim= ylimits, cex.main=CEX, cex.lab=CEX  ) 
  }else{
    plot( c(1:sample), greedy.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="", ylim= ylimits, cex.main=CEX, cex.lab=CEX  ) 
  }
  points( c(1:sample), greedy.dp[,arm], 'l', lty=2, col='blue', lwd=LWD)
  points( c(1:sample), rgreedy.unif[,arm], 'l', lty=3, col='green', lwd=LWD)
  points( c(1:sample), rgreedy.wf[,arm], 'l', lty=4, col='red', lwd=LWD)
}
for(arm in 1:K)
{
  ylimits= c( min( c(tgreedy.orig[1:sample, arm], tgreedy.dp[1:sample, arm], rtgreedy.unif[1:sample, arm], rtgreedy.wf[1:sample, arm]) )*1.05,  max( c(tgreedy.orig[1:sample, arm], tgreedy.dp[1:sample, arm], rtgreedy.unif[1:sample, arm], rtgreedy.wf[1:sample, arm]) )*1.05 ) 
  if(arm==1){
    plot( c(1:sample), tgreedy.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab=TeX(r'($\epsilon_t$-Greedy)'), ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }else{
    plot( c(1:sample), tgreedy.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="", ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }
  points( c(1:sample), tgreedy.dp[,arm], 'l', lty=2, col='blue', lwd=LWD)
  points( c(1:sample), rtgreedy.unif[,arm], 'l', lty=3, col='green', lwd=LWD)
  points( c(1:sample), rtgreedy.wf[,arm], 'l', lty=4, col='red', lwd=LWD)
}
for(arm in 1:K)
{
  ylimits= c( min( c(ts.orig[1:sample, arm], ts.dp[1:sample, arm], rts.unif[1:sample, arm], rts.wf[1:sample, arm]) )*1.05,  max( c(ts.orig[1:sample, arm], ts.dp[1:sample, arm], rts.unif[1:sample, arm], rts.wf[1:sample, arm]) )*1.05 ) 
  if(arm==1){  
    plot( c(1:sample), ts.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="TS", ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }else{
    plot( c(1:sample), ts.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="", ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }
  points( c(1:sample), ts.dp[,arm], 'l', lty=2, col='blue', lwd=LWD)
  points( c(1:sample), rts.unif[,arm], 'l', lty=3, col='green', lwd=LWD)
  points( c(1:sample), rts.wf[,arm], 'l', lty=4, col='red', lwd=LWD)
}
for(arm in 1:K)
{
  ylimits= c( min( c(ucb.orig[1:sample, arm], ucb.dp[1:sample, arm], rucb.unif[1:sample, arm], rucb.wf[1:sample, arm]) )*1.05,  max( c(ucb.orig[1:sample, arm], ucb.dp[1:sample, arm], rucb.unif[1:sample, arm], rucb.wf[1:sample, arm]) )*1.05 ) 
  if(arm==1){
    plot( c(1:sample), ucb.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="lil-UCB" , ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }else{
    plot( c(1:sample), ucb.orig[,arm],'l', lty=1, col='black', lwd=LWD, main=paste("Arm ", arm, "(", round(true_mean[arm], digits=2), ")",sep=""), xlab="T", ylab="" , ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
  }
  points( c(1:sample), ucb.dp[,arm], 'l', lty=2, col='blue', lwd=LWD)
  points( c(1:sample), rucb.unif[,arm], 'l', lty=3, col='green', lwd=LWD)
  points( c(1:sample), rucb.wf[,arm], 'l', lty=4, col='red', lwd=LWD)
}
dev.off()
