#-------------------------------------------------------------
# script, console, Enviroment, etc
# ctrl + shift + n : 새 스크립트 만들기
# ctrl + Enter : 실행
# 사칙연산자 : +, -, *, /, ^
# 나머지 %%
#-------------------------------------------------------------

# 아래를 코드로 만들어보세요
# 100에 50을 더하세요
# 45에 9를 빼주세요
# 23에 3을 곱해주세요
# 45를 9로 나눠주세요
# 45를 6으로 나눈 나머지는?
# 4의 3제곱은?

100 + 50
45 - 9
23 * 3
45 / 9
45 %% 6
4^3

#-------------------------------------------------------------
# vector?
#-------------------------------------------------------------

# 2개 이상 atomic vector는 c() 함수를 통해 만들 수 있다 (combination)

x <- c(5, 14, 6, 21, 100, 5, 3, 22) # x라는 변수에 저장

# 문자
c("에스비에스", "SBS")

# 시퀀스
seq(1, 10, by = 0.1)
seq(from = 1, to = 10, by = 0.1)

# 반복
rep(1:5, times = 5)
rep(1:5, times = 5, each = 10)

# parameter를 모를땐 함수 성격을 검색하는 습관을!
??rep 
help.search("rep")

# 벡터에 적용할 수 있는 함수들 예시 
sort(x) #정렬 (오름차순)
sort(x, decreasing = TRUE) # 정렬(내림차순)

rev(x) # reverse
table(x) # vector counting
unique(c(14, 14, 15, 17, 21, 21, 25, 30)) # unique value
paste(x, "개",sep="-")# 문자열 붙이기
paste0(x, "개",sep="-")# 문자열 붙이기



cor(c(1, 2, 3, 4, 5), c(10, 11, 12, 13, 20))

#-------------------------------------------------------------
# vector의 접근
#-------------------------------------------------------------
x[4] # 4번째 벡터
c(1,4,6,7)[4]
x[-4] # 4번째 제외하고
x[3:5] # 3~5번째 벡터만
x[-c(2:4)] # 2~4번째 벡터 제외하고
x[c(1, 5)] #1, 5번째 벡터만

x
x[x == 100] # TRUE에 해당하는 벡터만 반환
x[x < 5]

x[x %in% c(1, 2, 5)]

# 작음따옴표, 큰따옴표?
name <- c("추미애", "김무성", "김진태", "안철수")
name[name == "추미애"]
name[name %in% c("추미애", "안철수", "김성태", "진선미")]

5 == 5

5 > 1
3 == 2
3 != 2
3 / 2

#-------------------------------------------------------------
# 실습
# 1~10까지 벡터를 만들어서 변수명 ex1에 저정하세요
ex1 <- seq(1,10,1)
# ex1벡터에서 홀수만 추출해보세요
ex1[ex1 %%2 == 1 ]
#-------------------------------------------------------------
ex1 <- c(1:10000)
ex1 <- ex1[ex1 %% 2 == 1]
head(ex1, 10)

#-------------------------------------------------------------
# 팩터(factor)
#-------------------------------------------------------------
f.1 <- factor(c("신문", "방송", "인터넷", "스타트업미디어"))
f.1
f.2 <- factor(c("신문", "방송", "인터넷", "스타트업미디어"), 
              levels = c("스타트업미디어", "방송", "신문", "인터넷"))

#-------------------------------------------------------------
# 데이터타입 (type)
#-------------------------------------------------------------

# 무엇이 무엇이 다를까요?
number1 <- c(1, 2, 3, "4", 5, 1:10000)
length(number1)

number2 <- c("1", "2", "3", "4", "5")

is.numeric(number1)
is.character(number1)
is.factor(number1)
is.logical(number1)

number3 <- as.numeric(number2)
number1 <- as.numeric(number1)
number3
number4
is.character(number2)
is.character(number3)

sum(number1)
mean(number1)
median(number1)
max(number1)
min(number1)
quantile(number1)

round(15.6333, 1)
rank(c(10, 2, 5, 9, 9, 20), ties.method = "min")
rank(-c(10, 2, 5, 9, 9, 20), ties.method = "min")

sort(c(10,2,5,9,9,20),decreasing = TRUE)

var(number1)
sd(number1)



#-------------------------------------------------------------
# 패키지 설치 및 불러오기
#-------------------------------------------------------------
install.packages("tidyverse")
library(tidyverse)
install.packages("readxl")
library(readxl)

install.packages(c("dlylr","ggplot2"))
library(dlylr)

data(package = "dplyr")


#-------------------------------------------------------------
# 데이터 가져오기
#-------------------------------------------------------------
sample_xls <- read_xls("data/sample.xls", sheet = 1, col_names = FALSE)
#col_names = TRUE의 경우 1열을 빼고 가져옴
sample_csv <- read_csv("data/sample2.csv")

sample_csv <- readr::read_csv("data/sample2.csv")
#readr 라이브러리 킨 것

micro <- read_delim("data/micro_data.txt", delim = ",", col_names = F)


df <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQIGRAwCqdHohYKpkHNz10avinrvyoYKe0eSOol5_8wHxJEEfePoSwpyIiiku6JoDWXFQVDtqyMnBk-/pub?gid=0&single=true&output=csv")
#웹에 게시한 구글 스프레드시트 가져오기
a <- df$시도
a

df <- read_csv("data/sample1.csv")

is.numeric(df$증가율)
is.character(df$증가율)

#stringr
#stringr:: ㄴstring 처리에 최적화

df$증가율 <- str_remove(df$증가율, "%")
df$증가율 <- as.numeric(df$증가율)

df$증가율 <- as.numeric(str_remove(df$증가율, "%"))

mean(df$증가율)
median(df$증가율)

length(unique(df$의회명))
#unique: 중복 빼고, length: 개수 몇 개인지 확인
length(unique(df$시도))
#이렇게 차트 마지막에 확인하는 거 제일 중요

glimpse(df)

#벡터는 여기서 무엇?
df#데이터프레임: 길이가 동일한 벡터를 cbind
#matrix는 행과 열 모두 다루고 df는 열만 다룸
df$증가율 #벡터

df$인상금액 == df[[6]]
#[[]]는 벡터 값만 뽑힘
#$의미는 특정 열 지칭

a <- df[6]
#열만 뽑아서 저장. 데이터프레임

sum(df$인상금액 == df[[6]])

is.numeric(df$`2018년_월정수당`)
as.character(df$`2018년_월정수당`)
class(df)

head(df$인상금액)
head(df$인상금액, 20)

tail(df$증가율)
length(df$인상금액)

mean(df$`2018년_월정수당`)
mean(df$`2019년_월정수당`)

mean(df$`2019년_월정수당`) - mean(df$`2018년_월정수당`)

summary(df$`2018년_월정수당`)
summary(df)
class(df$증가율)

# 벡터는 한번에 처리
test <- separate(sample_csv, col = 기간, c("start", "end"), sep = "~")
test2 <- str_replace_all(sample_csv$기간, "\\.", "-")
paste(df$시도, "(광역)")

