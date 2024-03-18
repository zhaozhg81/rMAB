
## Inference based on the sample size of n
## UCB
bias.lil.ucb = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.lil.ucb = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.lil.ucb = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_original","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.lil.rucb.uniform = read.csv( paste(file_prefix, "uniform/experiments_lil_ucb_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.lil.rucb.uniform = read.csv( paste(file_prefix, "uniform/experiments_lil_ucb_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.lil.rucb.uniform = read.csv( paste(file_prefix, "uniform/experiments_lil_ucb_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.lil.rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.lil.rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.lil.rucb.wf = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.lil.ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/bias_all.csv", sep="")  )
var.lil.ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.lil.ucb.dp = read.csv( paste(file_prefix, "water_filling/experiments_lil_ucb_dp",DP,"_",rewards_dist2,"/pulls_all.csv", sep="")  )

## Greedy
bias.greedy = read.csv( paste(file_prefix, "water_filling/experiments_greedy_original","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.greedy = read.csv( paste(file_prefix, "water_filling/experiments_greedy_original","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.greedy = read.csv( paste(file_prefix, "water_filling/experiments_greedy_original","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rgreedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_greedy_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rgreedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_greedy_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rgreedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_greedy_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_greedy_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_greedy_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rgreedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_greedy_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_greedy_dp",DP,"_",rewards_dist2,"/bias_all.csv", sep="")  )
var.greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_greedy_dp",DP,"_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_greedy_dp",DP,"_",rewards_dist2,"/pulls_all.csv", sep="")  )

## t_greedy
bias.t_greedy = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_original","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.t_greedy = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_original","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.t_greedy = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_original","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rt_greedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_t_greedy_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rt_greedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_t_greedy_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rt_greedy.uniform = read.csv( paste(file_prefix, "uniform/experiments_t_greedy_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rt_greedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rt_greedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rt_greedy.wf = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.t_greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_dp",DP,"_",rewards_dist2,"/bias_all.csv", sep="")  )
var.t_greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_dp",DP,"_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.t_greedy.dp = read.csv( paste(file_prefix, "water_filling/experiments_t_greedy_dp",DP,"_",rewards_dist2,"/pulls_all.csv", sep="")  )

## TS
bias.ts = read.csv( paste(file_prefix, "water_filling/experiments_ts_original","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.ts = read.csv( paste(file_prefix, "water_filling/experiments_ts_original","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.ts = read.csv( paste(file_prefix, "water_filling/experiments_ts_original","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rts.uniform = read.csv( paste(file_prefix, "uniform/experiments_ts_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rts.uniform = read.csv( paste(file_prefix, "uniform/experiments_ts_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rts.uniform = read.csv( paste(file_prefix, "uniform/experiments_ts_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.rts.wf = read.csv( paste(file_prefix, "water_filling/experiments_ts_linear_const","_",rewards_dist2,"/bias_all.csv", sep="")  )
var.rts.wf = read.csv( paste(file_prefix, "water_filling/experiments_ts_linear_const","_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.rts.wf = read.csv( paste(file_prefix, "water_filling/experiments_ts_linear_const","_",rewards_dist2,"/pulls_all.csv", sep="")  )

bias.ts.dp = read.csv( paste(file_prefix, "water_filling/experiments_ts_dp",DP,"_",rewards_dist2,"/bias_all.csv", sep="")  )
var.ts.dp = read.csv( paste(file_prefix, "water_filling/experiments_ts_dp",DP,"_",rewards_dist2,"/variance_all.csv", sep="")  )
pull.ts.dp = read.csv( paste(file_prefix, "water_filling/experiments_ts_dp",DP,"_",rewards_dist2,"/pulls_all.csv", sep="")  )


## UCB
cov.ucb = COV( bias.lil.ucb[,2], bias.lil.ucb[,3], var.lil.ucb[,2], var.lil.ucb[,3], pull.lil.ucb[,2], pull.lil.ucb[,3])
cov.rucb.uniform = COV( bias.lil.rucb.uniform[,2], bias.lil.rucb.uniform[,3], var.lil.rucb.uniform[,2], var.lil.rucb.uniform[,3], pull.lil.rucb.uniform[,2], pull.lil.rucb.uniform[,3])
cov.rucb.wf = COV( bias.lil.rucb.wf[,2], bias.lil.rucb.wf[,3], var.lil.rucb.wf[,2], var.lil.rucb.wf[,3], pull.lil.rucb.wf[,2], pull.lil.rucb.wf[,3])
cov.ucb.dp = COV( bias.lil.ucb.dp[,2], bias.lil.ucb.dp[,3], var.lil.ucb.dp[,2], var.lil.ucb.dp[,3], pull.lil.ucb.dp[,2], pull.lil.ucb.dp[,3])


typeI.ucb = TYPEI( bias.lil.ucb[,2], bias.lil.ucb[,3], var.lil.ucb[,2], var.lil.ucb[,3], pull.lil.ucb[,2], pull.lil.ucb[,3])
typeI.rucb.uniform = TYPEI( bias.lil.rucb.uniform[,2], bias.lil.rucb.uniform[,3], var.lil.rucb.uniform[,2], var.lil.rucb.uniform[,3], pull.lil.rucb.uniform[,2], pull.lil.rucb.uniform[,3])
typeI.rucb.wf = TYPEI( bias.lil.rucb.wf[,2], bias.lil.rucb.wf[,3], var.lil.rucb.wf[,2], var.lil.rucb.wf[,3], pull.lil.rucb.wf[,2], pull.lil.rucb.wf[,3])
typeI.ucb.dp = TYPEI( bias.lil.ucb.dp[,2], bias.lil.ucb.dp[,3], var.lil.ucb.dp[,2], var.lil.ucb.dp[,3], pull.lil.ucb.dp[,2], pull.lil.ucb.dp[,3])

## Greedy
cov.greedy = COV( bias.greedy[,2], bias.greedy[,3], var.greedy[,2], var.greedy[,3], pull.greedy[,2], pull.greedy[,3])
cov.rgreedy.uniform = COV( bias.rgreedy.uniform[,2], bias.rgreedy.uniform[,3], var.rgreedy.uniform[,2], var.rgreedy.uniform[,3], pull.rgreedy.uniform[,2], pull.rgreedy.uniform[,3])
cov.rgreedy.wf = COV( bias.rgreedy.wf[,2], bias.rgreedy.wf[,3], var.rgreedy.wf[,2], var.rgreedy.wf[,3], pull.rgreedy.wf[,2], pull.rgreedy.wf[,3])
cov.greedy.dp = COV( bias.greedy.dp[,2], bias.greedy.dp[,3], var.greedy.dp[,2], var.greedy.dp[,3], pull.greedy.dp[,2], pull.greedy.dp[,3])

typeI.greedy = TYPEI( bias.greedy[,2], bias.greedy[,3], var.greedy[,2], var.greedy[,3], pull.greedy[,2], pull.greedy[,3])
typeI.rgreedy.uniform = TYPEI( bias.rgreedy.uniform[,2], bias.rgreedy.uniform[,3], var.rgreedy.uniform[,2], var.rgreedy.uniform[,3], pull.rgreedy.uniform[,2], pull.rgreedy.uniform[,3])
typeI.rgreedy.wf = TYPEI( bias.rgreedy.wf[,2], bias.rgreedy.wf[,3], var.rgreedy.wf[,2], var.rgreedy.wf[,3], pull.rgreedy.wf[,2], pull.rgreedy.wf[,3])
typeI.greedy.dp = TYPEI( bias.greedy.dp[,2], bias.greedy.dp[,3], var.greedy.dp[,2], var.greedy.dp[,3], pull.greedy.dp[,2], pull.greedy.dp[,3])

## t_greedy
cov.t_greedy = COV( bias.t_greedy[,2], bias.t_greedy[,3], var.t_greedy[,2], var.t_greedy[,3], pull.t_greedy[,2], pull.t_greedy[,3])
cov.rt_greedy.uniform = COV( bias.rt_greedy.uniform[,2], bias.rt_greedy.uniform[,3], var.rt_greedy.uniform[,2], var.rt_greedy.uniform[,3], pull.rt_greedy.uniform[,2], pull.rt_greedy.uniform[,3])
cov.rt_greedy.wf = COV( bias.rt_greedy.wf[,2], bias.rt_greedy.wf[,3], var.rt_greedy.wf[,2], var.rt_greedy.wf[,3], pull.rt_greedy.wf[,2], pull.rt_greedy.wf[,3])
cov.t_greedy.dp = COV( bias.t_greedy.dp[,2], bias.t_greedy.dp[,3], var.t_greedy.dp[,2], var.t_greedy.dp[,3], pull.t_greedy.dp[,2], pull.t_greedy.dp[,3])

typeI.t_greedy = TYPEI( bias.t_greedy[,2], bias.t_greedy[,3], var.t_greedy[,2], var.t_greedy[,3], pull.t_greedy[,2], pull.t_greedy[,3])
typeI.rt_greedy.uniform = TYPEI( bias.rt_greedy.uniform[,2], bias.rt_greedy.uniform[,3], var.rt_greedy.uniform[,2], var.rt_greedy.uniform[,3], pull.rt_greedy.uniform[,2], pull.rt_greedy.uniform[,3])
typeI.rt_greedy.wf = TYPEI( bias.rt_greedy.wf[,2], bias.rt_greedy.wf[,3], var.rt_greedy.wf[,2], var.rt_greedy.wf[,3], pull.rt_greedy.wf[,2], pull.rt_greedy.wf[,3])
typeI.t_greedy.dp = TYPEI( bias.t_greedy.dp[,2], bias.t_greedy.dp[,3], var.t_greedy.dp[,2], var.t_greedy.dp[,3], pull.t_greedy.dp[,2], pull.t_greedy.dp[,3])

## ts
cov.ts = COV( bias.ts[,2], bias.ts[,3], var.ts[,2], var.ts[,3], pull.ts[,2], pull.ts[,3])
cov.rts.uniform = COV( bias.rts.uniform[,2], bias.rts.uniform[,3], var.rts.uniform[,2], var.rts.uniform[,3], pull.rts.uniform[,2], pull.rts.uniform[,3])
cov.rts.wf = COV( bias.rts.wf[,2], bias.rts.wf[,3], var.rts.wf[,2], var.rts.wf[,3], pull.rts.wf[,2], pull.rts.wf[,3])
cov.ts.dp = COV( bias.ts.dp[,2], bias.ts.dp[,3], var.ts.dp[,2], var.ts.dp[,3], pull.ts.dp[,2], pull.ts.dp[,3])

typeI.ts = TYPEI( bias.ts[,2], bias.ts[,3], var.ts[,2], var.ts[,3], pull.ts[,2], pull.ts[,3])
typeI.rts.uniform = TYPEI( bias.rts.uniform[,2], bias.rts.uniform[,3], var.rts.uniform[,2], var.rts.uniform[,3], pull.rts.uniform[,2], pull.rts.uniform[,3])
typeI.rts.wf = TYPEI( bias.rts.wf[,2], bias.rts.wf[,3], var.rts.wf[,2], var.rts.wf[,3], pull.rts.wf[,2], pull.rts.wf[,3])
typeI.ts.dp = TYPEI( bias.ts.dp[,2], bias.ts.dp[,3], var.ts.dp[,2], var.ts.dp[,3], pull.ts.dp[,2], pull.ts.dp[,3])

coverage.prob= data.frame(ucb=c(cov.ucb, cov.ucb.dp, cov.rucb.uniform, cov.rucb.wf), greedy = c(cov.greedy, cov.greedy.dp, cov.rgreedy.uniform, cov.rgreedy.wf), t_greedy=c(cov.t_greedy,cov.t_greedy.dp, cov.rt_greedy.uniform, cov.rt_greedy.wf), 
                          ts=c(cov.ts, cov.ts.dp, cov.rts.uniform, cov.rgreedy.wf))

typeI= cbind(c(typeI.ucb, typeI.ucb.dp, typeI.rucb.uniform, typeI.rucb.wf),  c(typeI.greedy, typeI.greedy.dp, typeI.rgreedy.uniform, typeI.rgreedy.wf), c(typeI.t_greedy,typeI.t_greedy.dp, typeI.rt_greedy.uniform, typeI.rt_greedy.wf), 
                       c(typeI.ts, typeI.ts.dp, typeI.rts.uniform, typeI.rgreedy.wf))
colnames(typeI)=c("UCB","Greedy","epsilon-Greedy","TS")
rownames(typeI)=c("MAB","DP","rMAB(US)","rMAB(WF)")

coverage.prob= cbind( c(cov.ucb, cov.ucb.dp, cov.rucb.uniform, cov.rucb.wf), c(cov.greedy, cov.greedy.dp, cov.rgreedy.uniform, cov.rgreedy.wf),  c(cov.t_greedy,cov.t_greedy.dp, cov.rt_greedy.uniform, cov.rt_greedy.wf), 
                           c(cov.ts, cov.ts.dp, cov.rts.uniform, cov.rgreedy.wf))

colnames(coverage.prob)=c("UCB","Greedy","epsilon-Greedy","TS")
rownames(coverage.prob)=c("MAB","DP","rMAB(US)","rMAB(WF)")

CEX=2

filename=paste("../figure/cov_",rewards_dist,"_n_",sample,"_arms_",K, ".png", sep="")

png(filename, width=960, height=960)
barplot(coverage.prob, main="Coverag Prabability",
        xlab="", col=c("black","blue","green","red"),
        beside=TRUE,ylim=c(0,1.1), cex.names=CEX, cex.axis = CEX )
legend("top", 
       legend = c("MAB","DP","rMAB(US)","rMAB(WF)"), 
       fill = c("black", "blue","green","red"), cex=1.5)

dev.off()

filename=paste("../figure/typeI_",rewards_dist,"_n_",sample,"_arms_",K, ".png", sep="")

png(filename, width=960, height=960)
barplot(typeI, main="Type I Error",
        xlab="", col=c("black","blue","green","red"),
        beside=TRUE,ylim=c(0, max(typeI)*1.2), cex.names=CEX, cex.axis = CEX )
legend("top", 
       legend = c("MAB","DP","rMAB(US)","rMAB(WF)"), 
       fill = c("black", "blue","green","red"), cex=1.5)

dev.off()

