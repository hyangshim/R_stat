##### 확률 분포
### 이항 분포(Binomial Distribntion)

n = 6
p = 1/3
x = 0:n       #B(6,1/3)


# 확률 질량함수 nCx p^x (1-p)^(6-x)
dbinom(2,n,p)     # 6C2 (1/3)^2 (1-1/3)^(6-2) x=2
dbinom(x=4,size=n,prob=p)
# 확률값
px =dbinom(x,n,p)
px
plot(x,px,type='s',xlab = '성공횟수',ylab = '확률(p[X=x])',main = 'B(6,1/3)')
plot(x,px,type='h',xlab = '성공횟수',ylab = '확률(p[X=x])',main = 'B(6,1/3)',
    lwd=20,col='pink')

# 누적 분포함수
# pbinom(2, n, p)는 주어진 시행 횟수 'n'에서 성공 횟수가 2번 이하일 확률
# '2'는 성공 횟수 'k'를 나타내며, 'n'은 시행 횟수를, 'p'는 성공 확률을
pbinom(2,n,p) 

# 성공횟수가 1~3인 확률
dbinom(1,n,p) + dbinom(2,n,p) + dbinom(3,n,p) # 비권장(숫자가 많으면 사용불가)
pbinom(3,n,p) - pbinom(0,n,p) #권장

qbinom(p=0.1,n,p) 
qbinom(p=0.5,n,p) 

# 이항분포를 따르는  n개의 표본 추출 
set.seed(2023)
rbinom(10,n,p)

# 기댓값과 분산
n = 6
p = 1/3
x = 0:n       #B(6,1/3)
px =dbinom(x,n,p)

ex=sum(x *px)      #Expecation value = 기댓값
ex
ex2=sum(x^2*px)
varx =ex2 - ex^2       #Vairation
varx

# R에서 제공하는 함수 ()
#d binom   성공 횟수 x에 대한 이항분포의 확률을 반환
#b         성공 횟수 q 이하가 나올 확률을 반환
#q         성공 횟수의 최솟값을 반환
#r         주어진 시행 횟수와 성공 확률에 따라 이항분포로부터 n개의 난수를 생성하여 반환


### 정규분포
# 어느 대학교 남학생의 키의 평균은 170,표쥰편차는 6인 정규분포를 따른다.
# 180cm보다 큰 학생의 확률은?
options(digits = 4) # 소숫점 4자리
mu = 170    # 평균
sigma =6    # 표준편차
ll = mu - 3 * sigma  #lower limit # 하한값
ul = mu + 3 * sigma  # 상한값
ul = mu + 3 * sigma
#ll부터 ul까지 0.01 간격으로 범위 내의 값을 생성하여 x에 저장합니다.
x = seq(ll,ul,by=0.01)   # x 값 범위 생성
px = dnorm(x,mean=mu,sd=sigma)
plot(x,y,type = 'l',xlab='남학생의 키',ylab='P[X=x]',
     lwd=2,col='pink',main='N(170,6^2)')

prob=round(pnorm(180,170,6),4)
print(paste('180cm보다 큰 학생의 확률은', 1-prob,'입니다'))

# 상위 10%에 속하려면 키가 얼마이어야 하는가?
height = qnorm(0.9,170,6)    #177.7
height

# 키가 165cm ~ 175cm 확률

pnorm(175,170,6) - pnorm(165,170,6)


# 키가 95% 에 속하는 학생들의 키 범위는?
ll =round(qnorm(0.025,170,6),4)
ul = round(qnorm(0.975,170,6),4)
print(paste(ll,'~',ul,'(cm)'))  #"158.2402 ~ 181.7598 (cm)"

# 400개의 난수를 생성하는 모집단과 비교
set.seed(2023)
smp = rnorm(400,170,6)
print(paste(mean(smp),sd(smp)))
hist(smp,prob = T,main='N(170,6^2)으로부터 추출한 표본의 분포(n=400)',
     xlab = '',ylab = '',col='white',border = 'black')
lines(x,px,lty=2,col='red')

## 정규분포의 특징
mu =0
sigma =1
p0.05 =qnorm(0.95)     #qnorm(0.05) 와 부호가 반대인값
p0.05                  # 90% 신뢰수준
p0.025 =qnorm(0.975)
p0.025                 # 95% 신뢰수준,1.96
pnorm(1.96) - pnorm(-1.96)
qnorm(0.995)           # 99% 신뢰수준,2.576
pnorm(2.576) - pnorm(-2.576)

# 95% 신뢰구간 그림
z <- seq(-3, 3, by=0.001)
z.p <- dnorm(z)
plot(z, z.p, axes=F, type="l", 
     main="표준정규분포 (95%)", ylab="", ylim=c(-0.04, 0.4))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.96, -0.02, pch=17, col="red")
text(-1.96, -0.035, "-1.96", col="red")
points(1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col="red")

s <- seq(-1.96, 1.96, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)


# 90% 신뢰구간 그림
z <- seq(-3, 3, by=0.001)  # -3부터 3까지 0.001 간격으로 값 범위 생성
z.p <- dnorm(z)  # 표준정규분포의 확률밀도함수 값 계산
plot(z, z.p, axes = F, type = "l", main = "표준정규분포 (90%)", ylab = "", ylim = c(-0.04, 0.4))  # 그래프 그리기 설정
axis(1)  # x축 표시

lines(c(-3, 3), c(0, 0))  # 가로선 그리기
points(-1.645, -0.02, pch = 17, col = "red")  # 90% 신뢰구간의 양 끝 지점 표시
text(-1.645, -0.035, "-1.645", col = "red")  # -1.645 값 텍스트로 표시
points(1.645, -0.02, pch = 17, col = "red")  # 90% 신뢰구간의 양 끝 지점 표시
text(1.645, -0.035, "1.645", col = "red")  # 1.645 값 텍스트로 표시

s <- seq(-1.645, 1.645, by = 0.001)  # -1.645부터 1.645까지 0.001 간격으로 값 범위 생성
s.z <- dnorm(s, mean = 0, sd = 1)  # 평균 0, 표준편차 1인 정규분포의 확률밀도함수 값 계산
s <- c(-1.645, s, 1.645)  # 90% 신뢰구간 값에 양 끝 지점 추가
s.z <- c(0, s.z, 0)  # 90% 신뢰구간의 양 끝에서 y축 값 0 추가
polygon(s, s.z, col = "red", density = 10, angle = 305)  # 신뢰구간을 색칠하여 표시





























































