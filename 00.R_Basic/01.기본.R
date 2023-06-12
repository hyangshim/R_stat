####### R 변수
name <- 'james'
age = 25           # 할당 연산자로 <- =을 사용 할수 있음

name
print(age)
print(name,age)        # Error,print()에서는 하나의 인자만 사용가능
print(paste(name,age))       # [1] "james 25"
print(paste0(name,age))


# 변수명 - 단어와 단어 사이의 구분자로 .을 주로 사용
person.name <- 'Maria'
person.gender <- 'Female'
person.age <- 23

##### R 데이터 타입
# 1. numeric
x = 10.5
class(x)


# 2. integer
y = 10L
class(y)


# 3. complex(복소수)
z =9 + 3i
class(z)
print(z*z)

# 4.character(a.k.a string)
s = 'R is exciting'
class(s)


# 5.logical(a.k.a. boolean: TRUE,FALSE,T,F)
class(T)


#Type conversion
as.numeric(y)
as.numeric(TRUE)   # 1
as.character(F)     #"FAlSE"


###### Math
10 + 5
'10' + '5'       # string concatenation 은 paste() 함수를 사용할 것
max(5,10,15)     #15
sqrt(16)         #4 숫자의 제곱근을 반환합니다.
ceiling(1.2)     #반올림
floor(2.8)       #2(정수 내림 )

##### Strings
str <- "Lorem ipsum dolor sit amet,
consectertur adipiscing elit" 
str             #\n
cat(str)        # \n 대신에 출력에 줄바꿈이 들어감
length(str)
nchar(str)      # 문자의 갯수

###### 연산자(Operator)
# 1. 산술 연산자 : +,-,*,/
 2 ^ 5         # 32,exponent
 5 %% 2        # 1, modulo 나머지
 5 %/% 2       # 2.몫
 
# 2.비교 연산자 : 파이썬과 동일
 
# 3. 논리 연산자 :&,&&,|,||,!
 x > 10 & x < 20  # Logical AND , 10 < x < 20
 person.age > 24 || age > 24   #Logical OR
!(nchar(s) > 5 )    # Logical NOT
 
 
c(F,F,T,T) & c(F,T,F,T)
c(F,F,T,T) | c(F,T,F,T)
 