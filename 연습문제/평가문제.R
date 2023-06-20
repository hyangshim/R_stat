# 점수가 80점 이상이고 90점 이하인 학생의 비율
pnorm(860, 800, 30) - pnorm(830, 800, 830)


##### 모비율 추정
# 1. 대중교통을 이용하여 등교하는 학생의 비율 p에 대한 신뢰도 95%의 신뢰 구간
# phat - 1.96 * sqrt(phat * (1-phat) / n) < p < phat + 1.96 * sqrt(phat * (1-phat) / n)
# 0.5 - 0.98 / sqrt(n) < p < 0.5 + 0.98 / sqrt(n)
phat = 0.8
n = 100
ll = phat - 1.96 * sqrt(phat * (1-phat) / n)    # ll = phat - 0.98 / sqrt(n)
ul = phat + 1.96 * sqrt(phat * (1-phat) / n)    # ul = phat + 0.98 / sqrt(n)
c(ll, ul)       # 0.402 0.598

library(ggplot2)
head(mpg)

table(mpg$class)
compact = mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
t.test(compact$hwy, midsize$hwy)  #p-value = 0.1232
# 귀무가설 채택

###도시(cty) 연비
table(mpg$class)
compact = mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
t.test(compact$cty, midsize$cty)  #p-value = 0.02061
# 기각


###일반 휘발유(r)와 고급 휘발유(p)의 고속도로 연비
table(mpg$fl)
premium = mpg[mpg$fl == 'p',]
regular = mpg[mpg$fl == 'r',]
t.test(premium$cty, regular$hwy)

###compact 자동차의 전륜구동(f)이냐 후륜구동(r)이냐에 따른 고속도로 연비 

table(compact$drv)
shapiro.test(compact$hwy[compact$drv == 'f'])     
shapiro.test(compact$hwy[compact$drv == 4])     
t.test(compact$hwy[compact$drv == 'f'], compact$hwy[compact$drv == 4])


table(mpg$class)
compact= mpg[mpg$class == 'compact',]
midsize = mpg[mpg$class == 'midsize',]
subcompact = mpg[mpg$class == 'subcompact',]
t.test(compact$hwy, midsize$hwy,subcompact$hwy)


       