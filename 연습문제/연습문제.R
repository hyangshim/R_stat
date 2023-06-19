# 2.한 축구 선수가 페널티킥을 차면 5번 중 4번을 성공한다고 한다.
# 이 선수가 10번의 페널티킥을 차서 7번 성공할 확률을 구하시오.
n = 10     #시행횟수
p = 4/5    # 성공확률
x = 7      #성공횟수       

px =dbinom(x,n,p)
px

# 3.A라는 회사는 스마트폰의 한 부품을 만드는 회사로, 이 A사의 불량률은 5%로 알려져 있다.
#  이 회사의 제품 20개를 조사했을 때, 불량이 2개 이하로 나올 확률을 구하시오.

n = 20       #(시행 횟수)
p = 0.05     #(불량률)
x = 2        #(불량품 개수)
# 0부터 x까지의 확률을 계산하고, 그 확률을 모두 합산하여 px3에 저장
px3 =sum(dbinom(0:x,n,p))
px3

#어떤 희귀 바이러스에 감염되었을 때, 회복할 수 있는 치료율은 20%라고 한다. 이
#바이러스에 감염된 환자 20명을 치료했을 때, 적어도 2명 이상은 회복될 확률을 구하시오.
n = 20
p = 0.2 
x = 2
#x:n을 사용하여 "적어도 2명 이상 회복될 환자 수"를 나타냅니다. 따라서, x 값이 2이고 n 값이 20인 경우, x:n은 {2, 3, ..., 20}으로 2부터 20까지의 숫자 시퀀스를 생성
px =sum(dbinom(x:n,n,p))
px


##########################정규분포 ###############################
#A라는 전구회사에서 생산하는 전구의 수명은 800일이고 표준편차는 40일인 정규분포를
#따른다고 한다. 이때 전구의 수명이 750일 이하일 확률을 구하시오.

mu = 800
sigma =  40
prob=round(pnorm(750,800,40),4)
print(paste('전구의 수명이 750일 이하일 확률은', prob,'입니다'))

# 2. 어느 한 회사에 다니는 종업원들의 근무기간을 조사하였더니, 평균은 11년이고 분산이
# 16년인 정규분포를 따른다고 한다.
# 1) 20년 이상 근무한 종업원의 비율을 구하시오.
mu = 16
sigma =11
prob =round(pnorm(20,16,11),4)
1-prob

# 2) 근무연수가 가장 오래된 10%의 종업원은 이 회사에서 몇 년 이상 근무했다고볼 수 있는가?
qnorm(0.9,11,4)   #16.12621


#3. 어느 고등학교 3학년 학생들의 수학성적은 평균이 70이고 표준편차가 8인 정규분포를
#따른다고 한다. 이때 점수가 80점 이상이고 90점 이하인 학생의 비율을 구하시오.
pnorm(90,70,8) - pnorm(80,70,8)

#확률변수 X가 평균이 1.5, 표준편차가 2인 정규분포를 따를 때, 실수 전체의 집합에서
#정의된 함수 H(t)는 H(t) = P(t ≤ X ≤ t+1) 이다.
#H(0) + H(2)의 값을 구하시오

# 주어진 변수 설정
mu <- 1.5
sigma <- 2

# H(0) 계산
t1 <- 0
h1 <- pnorm(t1 + 1, mu, sigma) - pnorm(t1, mu, sigma)

# H(2) 계산
t2 <- 2
h2 <- pnorm(t2 + 1, mu, sigma) - pnorm(t2, mu, sigma)

# H(0) + H(2) 값 계산
h_sum <- h1 + h2

# 결과 출력
print(paste('H(0) + H(2)의 값은', h_sum, '입니다.'))



#######################-Sample T 테스트#########################
# 주어진 샘플 데이터
sample_data <- c(980, 1008, 968, 1032, 1012, 996, 1021, 1002, 996, 1017)

# 샘플의 크기
n <- length(sample_data)

# 샘플의 평균
sample_mean <- mean(sample_data)

# 샘플의 표준편차
sample_sd <- sd(sample_data)

# 모집단의 평균
population_mean <- 1000

# 모집단의 표준편차
population_sd <- NULL  # 모집단의 표준편차를 알지 못하므로 NULL로 설정

# Sample T-테스트 수행
t_stat <- (sample_mean - population_mean) / (sample_sd / sqrt(n))
p_value <- pt(t_stat, df = n - 1, lower.tail = FALSE)

# 결과 출력
print(paste("Sample T-테스트 결과:"))
print(paste("t-통계량 =", t_stat))
print(paste("p-value =", p_value))


#평균 성적
data=c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)
n=length(data)
data_mean =mean(data)
data_sd =sd(data)
population_mean =55
population_sd =NULL
t_stat <- (data_mean - population_mean) / (data_sd / sqrt(n))
p_value <- pt(t_stat, df = n - 1, lower.tail = FALSE)
t_stat
p_value

#알코올
sample_data=c(15.50, 11.21, 12.67, 8.87, 12.15, 9.88, 2.06, 14.50, 0, 4.97)
n <- length(sample_data)
sample_mean <- mean(sample_data)
sample_sd <- sd(sample_data)
population_mean <- 8.1
population_sd <- NULL  
t_stat <- (sample_mean - population_mean) / (sample_sd / sqrt(n))
p_value <- pt(t_stat, df = n - 1, lower.tail = FALSE)
t_stat
p_value


#######################-2Sample T 테스트#########################
# mtcars 데이터셋 로드
data(mtcars)

# 자동차 기어 종류(am)에 따른 연비(mpg) 데이터 추출
mpg_auto <- mtcars$mpg[mtcars$am == 0]  # 오토매틱(0) 기어의 연비 데이터
mpg_manual <- mtcars$mpg[mtcars$am == 1]  # 수동(1) 기어의 연비 데이터

# t-테스트 수행
t_result <- t.test(mpg_auto, mpg_manual)

# 결과 출력
print(paste("T-테스트 결과:"))
print(t_result)    #p-value = 0.001374

library(MASS)
data(Cars93)

# 생산국이 USA인 데이터와 non-USA인 데이터로 분리
usa_cars <- Cars93[which(Cars93$Origin == "USA"), "Price"]
non_usa_cars <- Cars93[which(Cars93$Origin != "USA"), "Price"]


# 독립표본 t-검정 수행
t_test_result <- t.test(usa_cars, non_usa_cars)

# 결과 출력
print(paste("독립표본 t-검정 결과:"))
print(paste("t-통계량 =", t_test_result$statistic))
print(paste("p-value =", t_test_result$p.value))   #p-value = 0.34279


