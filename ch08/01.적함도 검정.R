#### 적합도 검정
# 멘델의 유전 법칙

x = c(315,108,101,32)
chisq.test(x,p=c(9,3,3,1)/16)

# 케이제곱 : 0.47002
# 자유도 = 3인 카이제곱 분포
# 유의확률 : 0.9254 > 0.05 이므로 귀무가설 채택
# F2의 발현비율이 9:3:3:1 이다.


### 동질성 검정
# 연령대별 sns 이용별
sns = read.csv('data/snsbyage.csv',stringsAsFactors = F)
head(sns)
tail(sns)
sns$age =factor(sns$age,levels=c(1,2,3),labels = c('20대','30대','40대'))
sns$service = factor(sns$service,levels = c('F','T','K','C','E'),ordered = T)
sns.tab =table(sns$age,sns$service)
sns.tab


ct.info = chisq.test(sns.tab)
ct.info
names(ct.info)
ct.info$p.value
# 유의확률이 0.05보다 작으므로 귀무가설 기각
# 연령대별 sns 이용율에는 차이가 있다.


# 분석
ct.info$expected
ct.info$observed
chi.sum =0
for (i in 1:3){
    for(k in 1:5){
        chi.sum =chi.sum + 
            (ct.info$observed[i,k]-ct.info$expected[i,k])^2/ct.info$expected[i,k]
    }
}
chi.sum                   # 102.752
1-pchisq(chi.sum,df=8)    # p-value ~0


# table 관련
# margin 소계
margin.table(sns.tab,margin = 1)
margin.table(sns.tab,margin = 2)
margin.table(sns.tab)    #총합계
addmargins(sns.tab)


### 독립성 검정 
data("UCBAdmissions")
UCBAdmissions
ucba.tab=apply(UCBAdmissions,c(1,2),sum)
ucba.tab



chisq.test(ucba.tab)    #p-value 2.2e-16
# 유의확률이 0.05보다 작으므로 귀무가설 기각










