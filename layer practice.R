library(tidyverse)
library(gcookbook)

#---------------------------------------------------------
# Anscombe’s quartet
#---------------------------------------------------------

# Anscombe 데이터
glimpse(anscombe)

# 상관계수를 살펴보자
map_dbl(1:4, 
        function(x){cor(anscombe[, x], anscombe[, x+4])})

# shortcut
map_dbl(1:4,
        ~cor(anscombe[,.], anscombe[, .+4]))

c1 <- ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = "lm")

c2 <- ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = "lm")

c3 <- ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = "lm")

c4 <- ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = "lm")

gridExtra::grid.arrange(c1, c2, c3, c4, ncol = 2)

#---------------------------------------------------------
# Grammar of Graphics Layer Concept
#---------------------------------------------------------

#step1 : data
ggplot(data = iris)

#step2 : Aesthetics
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width))

#step3 : Geometries
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

#step4 : Facets
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species)

#step5 : Statistics
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species) +
  geom_smooth(method = "lm", se = FALSE)

#step6 : Coordinates
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species) +
  geom_smooth(method = "lm", se = FALSE) +
  coord_cartesian(xlim = c(5, 6))

#step7 : Coordinates
ggplot(data = iris,
       aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  facet_wrap(~Species) +
  geom_smooth(method = "lm", se = FALSE) +
  coord_cartesian(xlim = c(5, 6)) +
  theme(strip.background = element_rect(colour = "black", fill = "white"))

#---------------------------------------------------------
# base vs. ggplot2 graphics
#---------------------------------------------------------

#base
plot(iris$Sepal.Length, iris$Sepal.Width)
points(iris$Petal.Length, iris$Petal.Width, col = "red")

#ggplot2
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() +      
  geom_point(aes(x=Petal.Length, y=Petal.Width), color = "red") + 
  labs(x="Length", y="Width")

#---------------------------------------------------------
# 데이터
# wrangling에 따라 동일한 데이터셋도 다양하게 시각화
#---------------------------------------------------------
load("iris.RData")

# 아래 각각의 데이터셋 구조를 살펴봅시다
# iris 데이터셋의 변형에 따른 열은 어떻게 달라졌나요?

str(iris)
str(iris.wide)
str(iris.tidy)

# iris로 시각화(1)
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
  geom_point() +
  facet_grid(. ~ Species) +
  scale_x_discrete()

# iris.wide로 시각화(2)
head(iris.wide)
ggplot(iris.wide, aes(x = Length, y = Width, color = Species)) +
  geom_point() +
  facet_grid( ~ Species)

# iris.tidy로 시각화(3)
head(iris.tidy)
ggplot(iris.tidy, aes(x = Species, y = Value, color = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure) 
#jitter는 겹친 점 흩뿌리기 위해 사용

# iris.tidy를 만들어보자
iris.tidy <- iris %>%
  gather(key, Value, -Species) %>%
  separate(key, c("Part", "Measure"), "\\.")

# 실습 데이터 cafe.csv & judge_b.csv를 gather 해보세요
df_cafe <- read_csv("data/cafe.csv")
df_cafe2 <- df_cafe %>% gather(key="date", value="number", ends_with("월"))
ggplot(df_cafe2, aes(x=행정구역,y=number))+geom_col()+facet_wrap(~ date)


