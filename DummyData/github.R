library(pretest)
library(readxl)

#prepare data
data <- read_excel("C:/Users/rp1e23/Desktop/dummy_data_2.xlsx")
y = data$y
x1 = data$x1
x2 = data$x2

#recursive residuals
ehat1 <- recursive_hstep_fast(y,x1,0.25,1)
ehat2 <- recursive_hstep_fast(y, cbind(x1,x2), 0.25,1)

#plot it
plot(ehat1, main = "Recursive residuals", ylab = "ehat values", col = 2)
lines(ehat2, col = 4, type = "p", pch = 1)
legend("bottomleft", legend = c("ehat1", "ehat2"), col = c(2,4), pch = 1, cex = 0.8)

#test statistics
S0test = Nested_Stats_S0(ehat1, ehat2, lam10=1, lam20=0.5)
Sbartest = Nested_Stats_Sbar(ehat1, ehat2, lam20=0.5, tau0=0.8)
dm_cw_test = dm_cw(ehat1, ehat2)




