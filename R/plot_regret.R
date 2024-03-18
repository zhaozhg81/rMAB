
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


filename=paste("../figure/regret_",rewards_dist,"_n_",sample,"_arms_",K, ".pdf", sep="")

CEX=1.5
LWD=3

pdf(file=filename)
par(mfrow=c(2,2), mgp=c(2,1,0))
arm= K+1

ylimits= c( min( c(greedy.orig[10:sample,arm], greedy.dp[10:sample,arm], rgreedy.unif[10:sample,arm], rgreedy.wf[10:sample,arm]) )*0.95,  max( c(greedy.orig[10:sample, arm], greedy.dp[10:sample, arm], rgreedy.unif[10:sample, arm], rgreedy.wf[10:sample, arm]) )*1.05 ) 
plot( c(10:sample), greedy.orig[10:sample,arm],'l', lty=1, col='black', lwd=LWD, main="Greedy", xlab="T", ylab="Regret", ylim= ylimits, cex.main=CEX, cex.lab=CEX  ) 
points( c(10:sample), greedy.dp[10:sample,arm], 'l', lty=2, col='blue', lwd=LWD)
points( c(10:sample), rgreedy.unif[10:sample,arm], 'l', lty=3, col='green', lwd=LWD)
points( c(10:sample), rgreedy.wf[10:sample,arm], 'l', lty=4, col='red', lwd=LWD)

ylimits= c( min( c(tgreedy.orig[10:sample, arm], tgreedy.dp[10:sample, arm], rtgreedy.unif[10:sample, arm], rtgreedy.wf[10:sample, arm]) )*0.95,  max( c(tgreedy.orig[10:sample, arm], tgreedy.dp[10:sample, arm], rtgreedy.unif[10:sample, arm], rtgreedy.wf[10:sample, arm]) )*1.05 ) 
plot( c(10:sample), tgreedy.orig[10:sample, arm],'l', lty=1, col='black', lwd=LWD, main=TeX(r'($\epsilon_t$-Greedy)'),, xlab="T", ylab="Regret", ylim= ylimits, cex.main=CEX, cex.lab=CEX   )
points( c(10:sample), tgreedy.dp[10:sample, arm], 'l', lty=2, col='blue', lwd=LWD)
points( c(10:sample), rtgreedy.unif[10:sample, arm], 'l', lty=3, col='green', lwd=LWD)
points( c(10:sample), rtgreedy.wf[10:sample, arm], 'l', lty=4, col='red', lwd=LWD)

ylimits= c( min( c(ts.orig[10:sample, arm], ts.dp[10:sample, arm], rts.unif[10:sample, arm], rts.wf[10:sample, arm]) )*0.95,  max( c(ts.orig[10:sample, arm], ts.dp[10:sample, arm], rts.unif[10:sample, arm], rts.wf[10:sample, arm]) )*1.05 ) 
plot( c(10:sample), ts.orig[10:sample, arm],'l', lty=1, col='black', lwd=LWD, main="TS", xlab="T", ylab="Regret", ylim= ylimits, cex.main=CEX, cex.lab=CEX  )
points( c(10:sample), ts.dp[10:sample, arm], 'l', lty=2, col='blue', lwd=LWD)
points( c(10:sample), rts.unif[10:sample, arm], 'l', lty=3, col='green', lwd=LWD)
points( c(10:sample), rts.wf[10:sample, arm], 'l', lty=4, col='red', lwd=LWD)

ylimits= c( min( c(ucb.orig[10:sample, arm], ucb.dp[10:sample, arm], rucb.unif[10:sample, arm], rucb.wf[10:sample, arm]) )*0.95,  max( c(ucb.orig[10:sample, arm], ucb.dp[10:sample, arm], rucb.unif[10:sample, arm], rucb.wf[10:sample, arm]) )*1.05 ) 
plot( c(10:sample), ucb.orig[10:sample, arm],'l', lty=1, col='black', lwd=LWD, main="lil-UCB", xlab="T", ylab="Regret" , ylim= ylimits, cex.main=CEX, cex.lab=CEX   )
points( c(10:sample), ucb.dp[10:sample, arm], 'l', lty=2, col='blue', lwd=LWD)
points( c(10:sample), rucb.unif[10:sample, arm], 'l', lty=3, col='green', lwd=LWD)
points( c(10:sample), rucb.wf[10:sample, arm], 'l', lty=4, col='red', lwd=LWD)
dev.off()
