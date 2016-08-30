for (j in c(1,1000,10000)){
  set.seed(j)
  epsilon = rnorm(1000,0,4)
  mu      = 0.5
  y       = mu + epsilon[-1] + 0.5 * epsilon[-length(epsilon)]
  LogLik  = c()
  aic     = c()
  bic     = c()
  for (i in 1:15){
    model     = arima(y, order = c(i,0,0), include.mean = F)
    LogLik[i] = model$loglik
    aic[i]    = AIC(model, k = 2)
    bic[i]    = BIC(model)
  }

  dev.new()
  par(mfrow = c(3,1))
  plot(LogLik, xlab = "Number of parameters", ylab = "LogLik")
  plot(aic, xlab = "Number of parameters", ylab = "AIC")
  plot(bic, xlab = "Number of parameters", ylab = "BIC")
}
