MyVarMC <- function(port=port, wei=e.weight, comp.days=1, size.days=251,
  conf=0.95, iter=1000){
    val <- port %*% wei
    mcvar <- c(rep(0,comp.days))
    for(i in 1:comp.days){
      a <- 1+i; b <- size.days+i
      data <- port[a:b,]
      mu <- apply(data, 2, mean)
      var_cov <- cov(data)
      mc_ret <- mvrnorm(iter, mu, var_cov)
      mc_port_ret <- mc_ret %*% wei
      mcvar[i] <- quantile(mc_port_ret, 1-conf)
      }
    mcfail <- sum((val[0:comp.days]<0)&(val[0:comp.days]<mcvar))/length(mcvar)
    return(list(VaR=mcvar,Fail=mcfail))
  }
