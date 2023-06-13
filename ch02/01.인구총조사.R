load('data/pop.rda')
head(pop)
tableV1=table(pop$V1)
barplot(tableV1,main='남여 인구수',xlab = '성별',ylab = '인구')


tableV5=table(pop$V5)
tableV5
barplot(tableV5,main = '출생아별 빈도',xlab='출생아수',ylab='빈도')

hist(pop$V2,main = '연령별 분포',xlab = '연령',ylab = '빈도')
hist(pop$V2,breaks = c(seq(0,90,10)),right = F,  probability = T,
     #breaks 10살씩 묶음 ,right의 시작점 이상, 끝점 미만이 되도록 
     main = '연령별 분포',xlab = '연령',ylab = '밀도도')

tableV4=table(pop$V4)
tableV4

pie(tableV4,main = '학력별 비중',cex=0.8) #cex 이름표의 크기를 축소


