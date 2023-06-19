###### 일원 분산분석(ANOVA : Analysis of variance)
ad = read.csv('data/age.data.csv')
head(ad)
tail(ad)
ad$scale =factor(ad$scale)

## 그룹을 나눠서 
g1 = ad[ad$scale == 1,]
g2 = ad[ad$scale == 2,]
g3 = ad[ad$scale == 3,]
boxplot(g1$age,g2$age,g3$age)

#한반에
boxplot(age ~ scale,data=ad,col=rainbow(3))


# 등분산 검증
install.packages('lawstat')
library(lawstat)
levene.test(ad$age,ad$scale)   #p-value = 0.7105 
# 분산이 같다라는 귀무가설 채택 --> 분산이 같다

# Anova 응답변수 ~ 처리변수"
#응답변수는 관심 있는 수치 데이터(예: 수확량)이고, 
#처리변수는 모집단을 구분하는 요인(예: 비료 종류)입니다.
ow = lm(age~scale,data=ad)
anova(ow)                 # p-value = 0.6941

# 평균이 같다라는 귀무가설 채택 --> 평균이 같다
# anova 결과 F-value : 0.366
1 - pf(0.366,2,147)           # P-value:0.6941











