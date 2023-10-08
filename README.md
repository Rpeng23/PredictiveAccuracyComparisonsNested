# PredictiveAccuracyComparisonsNested
This repository contains the codes for using the predictive accuracy comparison tests developed in Pitarakis, J. (2023). "A novel approach to predictive accuracy testing in nested environments", Econometric Theory, 2023.

Funding from the ESRC through grant ES/W000989/1 is gratefully acknowledged.

# Background
In ET2023, Pitarakis proposed a series of test statistics for testing that two nested models have an equal out of sample predictive accuracy (null hypothesis). 
Informally: consider two competing (nested) models given by (ET 1) and (ET 2) in the paper and suppose that you wish to test the null that 
MSE01 = MSE02 vs MSE01 > MSE02. 
Once one obtains the out-of-sample forecast errors associated with each model (see below) one feeds them in the test statistic (ET 15) and (ET 16) which are shown to be asymptotically normally distributed. There is also an adjusted version of each of these test statistics discussed below.

The paper builds forecasts in a recursive manner. Note also that for the paper mainly considers 1-step ahead prediction, while the codes available are adapted for h-steps ahead prediction:
y_{t+h} = β_0 βx_t + u_{t+h}, (1)
and suppose that there are n observations. 

Recursive forecasting (expanding window) involves choosing a sample location (say k0 = [n*π0] for some π0 ∈ (0, 1)) to start the first estimation i.e., run OLS on (1) using t = 1, . . . , k0, obtain the corresponding LS estimate, say \hat{β}(1: k0) and use it to forecast y_{k0+h} as \hat{y}_{k0+h}|k0 = \hat{β}(1: k0) x_{k0}. Next, rerun the same regression using t = 1, . . . , k0 + 1, get the updated LS estimate of β and form the forecast \hat{y}_{k0+h+1}|k0+1 = \hat{β}(1: k0 + 1) x_{k0+1}. Repeat for all (feasible) t i.e. the last forecast should be \hat{y}_{n}|n−h. Once these forecasts have been obatained one can get the corresponding forecast errors as e_{t+1}|t = y_{t+1} − \hat{y}_{t+1}|t. 

Note that in this example this should give you a total of (n − k0 - h + 1) forecast error observations. Suppose you do that across two competing models and obtain two sequences of one-step ahead forecast errors, say \hat{e}_1 and \hat{e}_2. These are the inputs subsequently used in the test statistics developed in paper.

