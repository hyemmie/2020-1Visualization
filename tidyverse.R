#-------------------------------------------------------------------------------------
# 모든 챕터는 실습 코드 첨부
# for, while 등 반복문
# if, if_else
# function()
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
# for 반복문
#-------------------------------------------------------------------------------------
library(tidyverse)

# 일단 콘솔에 찍어보기
for (i in 1:10) {
    print(i)
    Sys.sleep(1.0)
}

final.value <- NULL
for (i in 1:100) {
    value <- str_c(i, "가 돌아갑니다")
    final.value <- c(final.value,value)
}
final.value
View(final.value)
# 반복문을 돌려 연산한 값을 새로운 변수에 넣어보자
for (k in 1:10) {
    result <- k + 5
    print(result)
    Sys.sleep(1.0)
}

# 결과에 넣어주려면 placeholder 역할 벡터가 필요
result.final <- NULL
for (q in 1:10) {
    result <- q + 5
    
    # 벡터의 결합 방식 떠올려보기
    result.final <- c(result.final, result)
}
print(result.final)

# 퀴즈1 : 아래의 결과는 무엇?
x <- c(2,5,3,9,8,11,6)
count <- 0

for (val in x) {
    if(val %% 2 == 0) {
        count <- count+1
    }}


#-------------------------------------------------------------------------------------
# while 반복문 : 조건이 참이면 반복문을 실행
# for는 반복 횟수를 정확하게 알아야 하고 while은 모를때 활용하면 좋다
#-------------------------------------------------------------------------------------
i <- 1
while (i < 6) {
    print(i)
    i <- i+1
}

while (i) {
    test <- i * 5
    print(test)
    if(test >= 20) break
    i <- i + 1
}

i <- 0
while (i >= 9){
    i <- i + 1
    if (i %% 2 == 0){
        next
    }
    print (i)
    
}

#-------------------------------------------------------------------------------------
# if 조건문
#-------------------------------------------------------------------------------------
check <- 0
if(check == 1){
    print ("check의 값은 TRUE입니다. ")
}else{
    print ("check의 값은 TRUE가 아닙니다.")
}

library(tidyverse)

y <- c(100, -50, 5, 3, 21, -2)
for (t in seq_along(y)) {
    if(y[t] < 0){
        y[t] <- as.numeric(str_remove(y[t], "-"))
    }
    print(y[t])
}

#-------------------------------------------------------------------------------------
# if_else 조건문
#-------------------------------------------------------------------------------------
ifelse(1 == TRUE, "Yes", "No")

x <- 1:10
ifelse(x %% 2 == 0, "짝수", "홀수")

price <- runif(100, 1, 100)
ifelse(price > 50, "비싸군", "괜찮네")
#-------------------------------------------------------------------------------------
# function의 이해
#-------------------------------------------------------------------------------------
f(5, 10)
f <- function(x, y){
    z <- x + y
    return (z)
}


install.packages("lubridate")
library(lubridate)
# 1964.2.14 / "1964-02-14" / 14-02-1964

# 날짜를 넣으면 오늘과의 차이 계산하는 함수 만들어보기
dday <- function(d){
    diffs <- lubridate::today() - as.Date(d)
    return(diffs)
}

dday("2019-02-23")


mydates <- c("2018-04-25", "2017-05-24", "2002-06-12", "1999-12-31", "2018-09-12", "2005-04-15", "2011-12-25", "2007-11-23")


# for 반복문
for(i in mydates){
    diffs <- lubridate::today() - as.Date(i)
    print(diffs)
}

# lapply 함수
lapply(mydates, dday) 

# purr
map(mydates, dday)

#-------------------------------------------------------------------------------------
# Tidy data : count, gather, spread
# Tidyverse : select, filter, mutate, arrange, group_by, summarise
#-------------------------------------------------------------------------------------
library(tidyverse)

# count 함수는 해당 변수의 value 갯수를 세어준다
a1 <- iris %>% 
    count(Species)

ggplot(a1, aes(x=Species, y=n)) + 
    geom_col()

# Mac cmd+shift+M -> %>%
iris %>% count(Sepal.Length)

names(mpg) / colnames(mpg)

mpg %>% 
    count(cyl, sort = TRUE)
#sort -> 내림차순으로 정리

#-------------------------------------------------------------------------------------
# Tame data vs Tidy data (가로형 vs 세로형)
# 생각해 볼 것!
# 아래 데이터 시각화 어떻게? x축에 출석과 결석 y축에 횟수를 막대 그래프로!
#-------------------------------------------------------------------------------------
df_tm <- tibble(
    name = c("금진섭", "김해수", "임채민", "박혜준", "장해중", "배여운", "김중앙"),
    day1 = c("출석", "결석", "출석", "결석", "출석", "결석", "출석"),
    day2 = c("결석", "출석", "출석", "결석", "출석", "출석", "출석"),
    day3 = c("결석", "결석", "결석", "결석", "출석", "출석", "결석"),
    day4 = c("출석", "출석", "출석", "출석", "출석", "결석", "출석"),
    day5 = c("결석", "결석", "출석", "출석", "결석", "출석", "출석"),
    day6 = c("결석", "결석", "출석", "출석", "결석", "출석", "출석"),
    day7 = c("결석", "결석", "결석", "출석", "출석", "결석", "결석"),
    day8 = c("결석", "결석", "출석", "출석", "결석", "출석", "출석"),
    day9 = c("결석", "출석", "출석", "출석", "결석", "결석", "출석")
)
View(df_tm2)
# tame data -> tidy data, 가로형 -> 세로형
df_tm2 <- gather(df_tm, 
                 "category", 
                 "value", 
                 2:10)
# gather(df_tm, key값을 아우르는 열 이름 여기서는 day1-9의 열 이름!, 변수의 이름, 범위)

df_tm2 <- df_tm2 %>% 
    gather(key = "company",
           value = "value",
           starts_with("day"))
 

# 수치 변수 추가
df_tm3 <- df_tm2 %>%
    count(name, value)

# 시각화 x, y, fill 부분에 어떤 변수가 들어가있는지 확인해보자
ggplot(df_tm3, aes(x = as.character(name), y = n, fill = fct_relevel(value, "출석", "결석"))) +
    geom_col(position = "dodge") +
    theme_minimal(base_family = "AppleGothic")
 
#-------------------------------------------------------------------------------------
## 실습 데이터 가져오기
#-------------------------------------------------------------------------------------

patient_df <- read_csv("data/patient.csv")

# 구조 확인
str(patient_df)

# 요약해보기
summary(patient_df)

# 미리보기 
head(patient_df)
map_chr(patient_df, is.numeric)

# 칼럼이름 변경하기 (고혈압, 당뇨, 이상지질혈증, 폐결핵)
colnames(patient_df) <- c("year", "gu", "gender", "real_patient", "hypertension", "diabetes", "dyslipidemia", "tuberculosis")

# 다시 확인
head(patient_df)

patient_df2 <- patient_df %>% 
    gather(key="category", value="patients", 4:8)

# gather 함수로 모아보기
patient_df.tidy <- gather(patient_df, key = "category", value = "patient_count", 4:8)
patient_df.tidy2 <- gather(patient_df, key = "category", value = "patient_count", real_patient:tuberculosis)

patient_df.tidy <- filter(patient_df.tidy, gender != "합계")
patient_df.tidy <- patient_df %>% 
    gather(key = "category", value = "patient_count", 4:8) %>% 
    filter(gender !="합계") %>% 
    select(year, gu, patient_count)


# spread로 다시 wide형 (어디서부터 어디까지?)
spread(patient_df.tidy, category, patient_count)

# 다른 사례로 연습해보기
# UN 인구예측 데이터 scraping
install.packages("rvest", dependencies = T)
library(rvest)

df.pop <- read_html("https://en.wikipedia.org/wiki/World_population", encoding="UTF-8") %>% 
    html_table(fill = TRUE)

df.pop2 <- df.pop[[13]]
df.pop2 <- df.pop2 %>% 
    gather("category", "value", -1) %>% 
    mutate(value = str_remove(value, "\\(.+\\)"),
           value = as.numeric(str_remove(value, ",")))

ggplot(df.pop2, aes(x = Year, y = value, group = category, color = category)) +
    geom_line()

df.pop2 %>% spread(category, value)
