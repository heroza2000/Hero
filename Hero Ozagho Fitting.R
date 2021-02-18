> x <-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27)
> y <- c(1.098298, 1.094931, 1.091346, 1.105131, 1.114405, 1.118068, 1.102657, 1.095362, 1.08474, 1.094547, 1.095963, 1.090429, 1.111852, 1.112595, 1.118944, 1.123595, 1.125138, 1.123785, 1.178231, 1.176332, 1.181544, 1.193902, 1.192321, 1.184736, 1.218027, 1.22507, 1.22516)
> plot(x,y,pch=19)
> fit  <- lm(y~x)
> fit2 <- lm(y~poly(x,2,raw=TRUE))
> fit3 <- lm(y~poly(x,3,raw=TRUE))
> fit4 <- lm(y~poly(x,4,raw=TRUE))
> xx <- seq(30,160, length=50)
> plot(x,y,pch=19,ylim=c(0,150))
> lines(xx, predict(fit, data.frame(x=xx)), col="red")
> lines(xx, predict(fit2, data.frame(x=xx)), col="green")
> lines(xx, predict(fit3, data.frame(x=xx)), col="blue")
> lines(xx, predict(fit4, data.frame(x=xx)), col="purple")
> summary(fit)

Call:
lm(formula = y ~ x)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.035392 -0.022696  0.009038  0.020868  0.029503 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 1.0636105  0.0088325 120.420  < 2e-16 ***
x           0.0051842  0.0005513   9.403 1.09e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.02231 on 25 degrees of freedom
Multiple R-squared:  0.7796,    Adjusted R-squared:  0.7708 
F-statistic: 88.42 on 1 and 25 DF,  p-value: 1.093e-09

> summary(fit2)

Call:
lm(formula = y ~ poly(x, 2, raw = TRUE))

Residuals:
      Min        1Q    Median        3Q       Max 
-0.018614 -0.007655 -0.003023  0.007271  0.027721 

Coefficients:
                          Estimate Std. Error t value Pr(>|t|)    
(Intercept)              1.108e+00  8.114e-03 136.514  < 2e-16 ***
poly(x, 2, raw = TRUE)1 -3.923e-03  1.336e-03  -2.937   0.0072 ** 
poly(x, 2, raw = TRUE)2  3.252e-04  4.629e-05   7.026  2.9e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.01303 on 24 degrees of freedom
Multiple R-squared:  0.9279,    Adjusted R-squared:  0.9219 
F-statistic: 154.4 on 2 and 24 DF,  p-value: 1.975e-14

> summary(fit3)

Call:
lm(formula = y ~ poly(x, 3, raw = TRUE))

Residuals:
      Min        1Q    Median        3Q       Max 
-0.020541 -0.008972 -0.003583  0.008593  0.025545 

Coefficients:
                          Estimate Std. Error t value Pr(>|t|)    
(Intercept)              1.114e+00  1.170e-02  95.180   <2e-16 ***
poly(x, 3, raw = TRUE)1 -6.405e-03  3.554e-03  -1.802   0.0847 .  
poly(x, 3, raw = TRUE)2  5.429e-04  2.921e-04   1.858   0.0760 .  
poly(x, 3, raw = TRUE)3 -5.182e-06  6.866e-06  -0.755   0.4580    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.01314 on 23 degrees of freedom
Multiple R-squared:  0.9296,    Adjusted R-squared:  0.9205 
F-statistic: 101.3 on 3 and 23 DF,  p-value: 2.12e-13

> summary(fit4)

Call:
lm(formula = y ~ poly(x, 4, raw = TRUE))

Residuals:
      Min        1Q    Median        3Q       Max 
-0.023860 -0.006107  0.002273  0.004579  0.024338 

Coefficients:
                          Estimate Std. Error t value Pr(>|t|)    
(Intercept)              1.085e+00  1.373e-02  78.994  < 2e-16 ***
poly(x, 4, raw = TRUE)1  1.139e-02  6.531e-03   1.744  0.09506 .  
poly(x, 4, raw = TRUE)2 -2.198e-03  9.248e-04  -2.377  0.02659 *  
poly(x, 4, raw = TRUE)3  1.452e-04  4.920e-05   2.951  0.00739 ** 
poly(x, 4, raw = TRUE)4 -2.685e-06  8.723e-07  -3.078  0.00550 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.01124 on 22 degrees of freedom
Multiple R-squared:  0.9508,    Adjusted R-squared:  0.9419 
F-statistic: 106.3 on 4 and 22 DF,  p-value: 4.664e-14

> anova(fit,fit2)
Analysis of Variance Table

Model 1: y ~ x
Model 2: y ~ poly(x, 2, raw = TRUE)
  Res.Df       RSS Df Sum of Sq      F    Pr(>F)    
1     25 0.0124466                                  
2     24 0.0040717  1 0.0083749 49.364 2.899e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> anova(fit2,fit3)
Analysis of Variance Table

Model 1: y ~ poly(x, 2, raw = TRUE)
Model 2: y ~ poly(x, 3, raw = TRUE)
  Res.Df       RSS Df  Sum of Sq      F Pr(>F)
1     24 0.0040717                            
2     23 0.0039733  1 9.8414e-05 0.5697  0.458
> coef(fit)
(Intercept)           x 
1.063610453 0.005184198 
> coef(fit3)
            (Intercept) poly(x, 3, raw = TRUE)1 poly(x, 3, raw = TRUE)2 
           1.113939e+00           -6.404961e-03            5.429016e-04 
poly(x, 3, raw = TRUE)3 
          -5.182331e-06 
> coef(fit4)
            (Intercept) poly(x, 4, raw = TRUE)1 poly(x, 4, raw = TRUE)2 
           1.084970e+00            1.139288e-02           -2.197971e-03 
poly(x, 4, raw = TRUE)3 poly(x, 4, raw = TRUE)4 
           1.451917e-04           -2.685250e-06 
> 
