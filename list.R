#-------------------------------------------------------------
# 리스트(list)
#-------------------------------------------------------------

# 리스트는 (key, value)형태의 데이터를 담고 있는 배열
# 파이썬의 딕셔너리(dictionary)와 대응된다
# 키 값이란 특정 데이터 집합의 이름표 분류 기호 같은 것

# 리스트 만들어보기
list01 <- list(name = "visualization", time = "2:00PM")
list02 <- list(category = "students", name = c("Kim", "Park", "Lee", "Bae", list01))
list03 <- list(data = iris)

list01$name
list02$name$time

list01[1]
list02[2]$name
