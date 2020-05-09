library(tidyverse)

#-----------------------------------------------------------
# 속성 정보를 한번 바꿔보자
#-----------------------------------------------------------

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length)) +
  geom_point()

# 모든 점의 색상을 바꾸려면 aesthetics가 아닌 attributes를 설정
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length)) +
  geom_point(color = "red")

# Species에 따른 색상 구분은 attributes가 아닌 aesthetics를 설정
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
  geom_point()

#-----------------------------------------------------------
# 여러 레이어에서 바꿔보자
# aes위치는 바뀌어도 상관 없다. 단, 상속되는건 X
#-----------------------------------------------------------
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class))

ggplot(mpg, aes(x = displ)) +
  geom_point(aes(y = hwy, color = class))

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, color = class))

#-----------------------------------------------------------
# Aesthetics 실습(1) : mtcars데이터
#-----------------------------------------------------------

# 1 - mtcars데이터를 사용해서 mpg는 x축에, cyl은 y축에 맵핑해보세요
ggplot(mtcars, aes(x = mpg, y = cyl)) +
  geom_point()

# 2 - 반대로 cyl은 x축에, mpg는 y축에 맵핑하고 비교해보세요
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()

# 3 - wt는 x축에, mpg는 y축에 cyl은 color에 맵핑해보세요
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point()

# 4 - 3번 차트에 연결해서 덧붙여 shape는 1번, size는 4로 변경해보세요 
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(shape = 19, size = 4)
# 왜 cyl에 as.character()?

unique(mtcars$cyl)

#-----------------------------------------------------------
# Aesthetics 실습(2) 
#-----------------------------------------------------------

# 조금 전, 완성된 코드는 아래와 같습니다
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# 1 - color 대신 fill = cyl을 넣어보세요
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)


# 2 - 1번 차트에서 shape=21, size=4, alpha=0.6으로 속성을 바꿔보세요
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)


# 3 - 2번 차트에 col = am을 추가해보세요
ggplot(mtcars, aes(x = wt, y = mpg, color = am, fill= cyl)) +
  geom_point(shape = 21, size=4, alpha = 0.6)

#-----------------------------------------------------------
# Aesthetics 실습(3) : 어떻게 변하는지 살펴보세요
#-----------------------------------------------------------

# 1번
ggplot(mtcars, aes(x=wt, y=mpg, size=cyl)) + 
  geom_point()

# 2번
ggplot(mtcars, aes(x=wt, y=mpg, alpha=cyl)) + 
  geom_point()

# 3번
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(shape=mtcars$cyl)
#shape는 이산형으로 묶어야 함
#shape=as.factor(mtcars$cyl)로 하면 오류는 없으나 모양이 다르게 나옴 왜지?

# 4번
ggplot(mtcars, aes(x=wt, y=mpg, label=cyl)) + geom_point() + 
  geom_text()


#-----------------------------------------------------------
# Aesthetics 실습(4) : All about attritubes
# 아래 데이터의 Aesthetics가 아닌 Attribute를 사용해서
# 본인이 원하는 차트를 만들어보세요. (정답은 없음)
#-----------------------------------------------------------
df_attr <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSy_N5G_XSdrGJJSQnViIoRBz-iECV2_APIFPxH9GZV9A79Ar0Yol3s2b8yQluM188hz6tiCYXiJUNP/pub?gid=175829479&single=true&output=csv")

glimpse(df_attr)
df_attr <- df_attr %>% 
  group_by(location) %>% 
  summarise(means = mean(nurse_service, na.rm = T)) %>% 
  ungroup()

ggplot(df_attr, aes(x = location, y = means)) +
  geom_col() +
  theme_minimal(base_family = "AppleGothic") +
  geom_label(aes(label = location, family = "AppleGothic"))

ggplot(df_attr, aes(x = location, y = means)) +
  geom_col() +
  geom_label(aes(label = location, family = "NanumSquare")) +
  theme_base(base_family = "NanumSquare")


#-----------------------------------------------------------
# Aesthetics 실습(5) : your turn
#-----------------------------------------------------------
df_movie <- read_csv("data/practice_movie.csv")
df_hospital <- read.csv("data/hospital.csv",encoding="UTF-8")


#---------------
# Geometry
#---------------

ggplot(mtcars, aes(x=cyl, y=wt))+
  geom_point(alpha=.5)

ggplot(mtcars, aes(x=cyl, y=wt))+
  geom_jitter(alpha=.5)
# 상관관계를 알아볼 때 주로 사용

install.packages("gcookbook")
library(gcookbook)
pg_mean
installed.packages()

ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_col(fill="lightblue")

ggplot(pg_mean, aes(x=group, y=weight, fill=group)) +
  geom_col()

ggplot(pg_mean, aes(x=group, y=weight, fill="lightblue")) +
  geom_col()
# 색이 제대로 나오지 않음. aesthetic과 attribute 구분

ggplot(pg_mean, aes(x=group, y=weight, fill=group, color=group)) +
  geom_col(width=.05) +
  geom_point(size=5)

cabbage_exp

ggplot(cabbage_exp, aes(x=Date,y=Weight,fill=Cultivar)) +
  geom_col(position="dodge")
#position="stack" is defalut

ggplot(cabbage_exp, aes(x=Date,y=Weight,fill=Cultivar)) +
  geom_col(position=position_dodge2(width=1.4),preserve="single")







