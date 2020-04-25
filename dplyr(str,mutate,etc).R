# load library tidyverse
library(tidyverse)

# read_csv
sample_df <- read_csv("data/sample1.csv")
colnames(sample_df)[1] <- "no"
glimpse(sample_df)

#------------------------------------------------------------------
# seperate & unite
# 열(column)안에 문자열 중 특정 문자로 열을 나눔 = seperate
# 2개 이상의 열을 하나로 합치는 기능 = unite
#------------------------------------------------------------------
df.1 <- sample_df %>% 
    separate(col = gu, 
             into = c("주소구분1", "주소구분2"),
             sep = " ",
             remove = FALSE)

df.1 %>% 
    unite(col = "full_address",
          `주소구분1`, `주소구분2`,
          sep = "-",
          remove = TRUE)

#str_c("서울특별시""-""송파구")

#------------------------------------------
# str_* family (stringr)
# Character 벡터에 적용
#------------------------------------------
s.text <- c("부산시 동래구", "부산광역시 동래구", "부산광역시 동래구-", "부산광역시-동래구-", NA)
s.text

# str_remove & str_remove_all
str_remove(s.text, "-") 
#하나의 문자열에서 하이픈 하나만 지워줌
str_remove_all(s.text, "-")

# str_replace & str_replace_all
str_replace(s.text, "부산시", "부산광역시")
str_replace(s.text, "-", "=")
str_replace_all(s.text, "-", "=")

# str_replace_na
str_replace_na(s.text, "없어져라!")

# str_detect() -> TRUE or FALSE로 반환, filter에서 자주 활용
str_detect(s.text, "부산시")
str_detect(s.text, "부산광역시")

s.text2 < -s.text %>% filter(str_detect(s.text,"부산시"))
s.text2

school <- c("광진구 1번 출구","00초등학교","중학교","서울대학교")
sum(str_detect(school,"초등학교"), na.rm=TRUE)

# str_locate & str_locate_all
str_locate(s.text, " ")
#띄어쓰기 어디있냐
str_locate_all(s.text, " ")

# str_extract & str_extract_all
str_extract(s.text, "동래구")
str_extract(c("1050명(15%)", "500명(5%)"), "\\(.+\\)")
# 특수문자 앞에 \\, .은 숫자든 문자든, +는 하나 이상, 다시 특수문자 괄호 \\
# 다음 특수문자 앞까지 + 유
str_extract_all(s.text, "-")

#str_trim()
#------------------------------------------
# count
#------------------------------------------
sample_df %>% 
    count(category) 

sample_df %>% 
    count(category, public)

sample_df %>% 
    count(category, public, sort = T)

sample_df %>% 
    count(category)

# bar plot 만들 때 많이 씀


#------------------------------------------
# dplyr에서 select
# 필요없는 첫번째 열을 제거
#------------------------------------------
sample_df <- sample_df %>%
    select(-no, -code)
head(sample_df)

sample_df %>%
    select(1:2)

sample_df %>%
    select(contains("name"))

# 응용해서 써보자
# 2019 고위공직자 재산공개 샘플데이터
sample_df2 <- read_csv("data/sample2.csv")
glimpse(sample_df2)

# 만약에 2018년도에 해당하는 열만 추출하고 싶다면?
# dplyr::contains()를 활용해보자
# starts_with(), ends_with(), matches(), num_range(), 

# 칼럼명에 2018이 들어가는 열만 추출
sample_df2 %>% 
    select(contains("2018"))

# 칼럼명이 val로 시작하는 열만 추출
sample_df2 %>% 
    select(starts_with("val_"))


#------------------------------------------
# dplyr에서 filter
# 강남권에서 공립 중학교만 추출
#------------------------------------------
public <- sample_df %>% 
    filter(category == "강남권" & public == "공립")
View(public)

unique(sample_df$gu)
#dataframe 
sample_df %>% 
    distinct(gu) %>% 
    pull # pull은 벡터로 빼주는 파이프 기능

# gu칼럼 안에 벡터들
public_gangnam <- public %>%
    filter(gu %in% c("서울특별시 송파구", "서울특별시 강남구", "서울특별시 서초구"))

sample_df %>% 
    filter(str_detect(gu, "송파구"))

sample_df %>%
    filter(value > 10 & str_detect(gu, "양천구"))

#------------------------------------------
# dplyr에서 arrange
#------------------------------------------
sample_df %>% 
    arrange(value)

sample_df %>% 
    arrange(-value)

sample_df %>%
    arrange(desc(value))

sample_df %>% 
    arrange(category, desc(value))

#------------------------------------------
# dplyr에서 mutate
#------------------------------------------
sample_df %>% 
    mutate(message = str_c(school_name, "의 순유입은 ", value, "명 입니다"),
           value2 = value * 100 - 5) %>% View()

sample_df %>%
    count(category) %>%
    mutate(avg = n/sum(n))

sample_df %>% 
    mutate(avg = round((value / sum(value))*100, 2))

sample_df %>% 
    mutate(avg = str_c(round((value / sum(value))*100, 2), "%"))

#------------------------------------------
# dplyr에서 group_by & summarise
#------------------------------------------
sample_df %>%
    group_by(category,public) %>% 
    summarise(total = mean(value))

a <- sample_df %>% 
    group_by(category) %>% 
    summarise(count = n())

b <- sample_df %>%
    count(category)

sample_df %>%
    group_by(gu) %>% 
    summarise(total = sum(value)) %>% 
    arrange(desc(total))

sample_df %>%
    group_by(category, public) %>% 
    summarise(total = sum(value))

#----------------------------------------------------------------------
# 간단한 실습을 해봅시다!
# iris 데이터
#   1. Sepal(꽃받침)과 관련있는 column을 추출해서 df_Sepal 변수에 저장
#   2. Sepal.Length와 Petal.Length 모두 1.5 이상만 추출
#   3. Species(종)과 Petal.Width 순으로 내림차순 정렬
#   4. 새롭게 text 칼럼을 생성하고 Sepal.Length값을 활용해서 
#      "꽃받침 너비는 00입니다"라고 새롭게 만들어주세요
#   5. Species별 Sepal.Width의 평균값을 만들어보세요
#----------------------------------------------------------------------

iris

df_Sepal <- iris %>%
           select(contains("Sepal")) 
df_Sepal

iris %>%
     filter(Sepal.Length>=1.5 & Petal.Length>=1.5) %>%
     arrange(desc(Species), desc(Petal.Width))

iris %>% mutate(text = str_c("꽃받침 너비는 ",Sepal.Width,"입니다"))

iris %>% 
    group_by(Species) %>%
    summarise(sepalMean= mean(Sepal.Width))


#교수님 답
df_Sepal <- iris %>% 
    select(contains("Sepal"))

iris %>%
    filter(Sepal.Length >= 1.5 & Petal.Length >= 1.5)

iris %>%
    arrange(desc(Species), desc(Petal.Width))

iris %>% 
    mutate(text = str_c("꽃받침 너비는 ", Sepal.Width, "입니다"))

iris %>%
    group_by(Species) %>% 
    summarise(means = mean(Sepal.Width, na.rm = T))
