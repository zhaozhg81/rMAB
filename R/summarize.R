
output_string = function(X)
{
  s_output= ""
  for( i in 1:(dim(X)[1]-1 ) )
  {
    s_output = paste( s_output, '&', true_mean[i], sep ="  " )
    for(j in 1:4)
    {
      s_output = paste(s_output, '&', X[i,j], sep="  ")
    }
    s_output = paste( s_output, "\\", sep="   ")
  }
  s_output = paste( s_output, '& Regret' )
  for(j in 1:4)
  {
    s_output = paste(s_output, '&', X[K+1,j], sep="  ")
  }
  s_output
}

## Construct 1-alpha confidence interval 

COV <- function(X1, X2, V1, V2, N1, N2, alpha=0.05)
{
  df = N1*(N1 <= N2) + N2 *( N2 < N1)
  lcl = (X1 - X2) - qt( 1-alpha/2,df )*sqrt( V1/(N1+(N1==0)) + V2/(N2+(N2==0)) )
  ucl = (X1 - X2) + qt( 1-alpha/2,df )*sqrt( V1/(N1+(N1==0)) + V2/(N2+(N2==0)) )
  mean( (lcl<0 )*(0<ucl) )
}

TYPEI <- function(X1,X2,V1, V2, N1, N2, alpha=0.05)
{
  df = N1*(N1 <= N2) + N2 *( N2 < N1)
  z.stat = (X1-X2)/sqrt( V1/N1 + V2/N2 )
  pvalue = 1- pt( z.stat, df)
  mean(pvalue < alpha)
}


## Summarize type I error and coverage probability.



sample = 100
rewards_dist="Normal"; rewards_dist2= "norm"; DP=100
## K = 2; true_mean = c(1, 0.5)
K = 5; true_mean = c( 1,0.75,0.5,0.375,0.25 )

## rewards_dist="Bern";  rewards_dist2="bern"; DP = 200
## K = 2; true_mean = c(0.8, 0.2)
## K = 5; true_mean = c( 0.9 ,0.7,0.5,0.3,0.1 )


file_prefix = paste("../",rewards_dist,"/result/",rewards_dist2,"/",sample,"/Arm_",K,"/", sep="")

########################################################
## Regret
source("plot_regret.R")

########################################################
## bias
source("plot_bias.R")
filename


#########################################################
source("inference.R")
coverage.prob
typeI.prob

########################################################
## Bias of UBC only
source("plot_bias_ucb.R")
filename

########################################################
## Bias
source("bias_summary.R")
bias.summary

output_string(bias.summary[,1:4])

output_string(bias.summary[,13:16])

output_string(bias.summary[,5:8])

output_string(bias.summary[,9:12])
