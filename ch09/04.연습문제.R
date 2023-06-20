#### 회귀 분석
# Q - 1    
x =c(150, 160, 170, 180, 190)
y =c(176, 179, 182, 181, 185)
q1=lm(y ~ x)
q1$coefficients
height = q1$coefficients[2] * 165 +q1$coefficients[1]
height   #179.6 

#Q - 2
x =c(100,200,300,400,500)
y = c(30,70,85,140,197)
q2=lm(y ~ x)
q2$coefficients
card = q1$coefficients[2] * 250 +q1$coefficients[1]
card   #84.2 


# Q -3
mtcars
states = as.data.frame(mtcars[,c('disp','hp')])
head(states)
fit = lm(hp ~ disp,data=states)
fit$coefficients

plot(hp~disp,data=states)
abline(fit$coefficients)



