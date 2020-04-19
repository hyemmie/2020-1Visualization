#-------------------------------------------------------------
# data.frame
# 길이가 같은 벡터의 집합 (행과 열의 길이가 동일)
# 각 열마다 다른 형태의 자료를 담을 수 있음
#-------------------------------------------------------------

score_df <- data.frame(math = c(40, 70, 80),
                       korean = c(90, 20, 40),
                       english = c(19, 34, 90),
                       art = c("A", "A", "B"))

family.name <- data.frame(name = c("혜민","혜진","은혜","강규"),
                          age = c(23,21,52,54), 
                          gender = c("여","여","여","남"))

family.name[5,] <- c("할배", 90, "남")

# 데이터 체크
summary(score_df)
glimpse(score_df)
ncol(score_df)

summary(family.name)
glimpse(family.name)
ncol(family.name)

family.name$name <- as.character(family.name$name)
glimpse(family.name)


score_df$math

# 새로운 열 생성은 $를 붙이고 벡터를 넣어주면 된다
score_df$category <- c("필수", "선택", "필수")

score_df[2, 2] #2행 2열 
score_df[, 2] # 2열 전체
score_df[2, ] #2행 전체
score_df[, c(1, 3)] #1,3열 전체
score_df[, c("math", "english")] #math, english 열의 전체
score_df[score_df$math > 40, ] #조건에 맞는 값

#-------------------------------------------------------------
# 실습
# iris 데이터에서 Sepal.Length가 7보다 큰 항목만 불러오세요
iris <- iris
glimpse(iris)
iris[iris$Sepal.Length>7,]
# iris 데이터에서 Species가 'setosa'인 것만 불러오세요
iris[iris$Species == "setosa",]
#-------------------------------------------------------------