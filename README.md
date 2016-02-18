# var-monte-carlo
Value at Risk: monte carlo simulation

We specify the portfolio, weight, compute days, the size of the window of the 
simulated sample, and the number of artificial
returns to generate (iterations) when simulating based on the mean and variance
of the window length of portfolio data. For example, we type the following:

MyVarMC(port=port,wei=e.weight,comp.days=1,size.days=251,conf=0.95,iter=1000)
