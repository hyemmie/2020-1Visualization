#-------------------------------------------------------------
# 메트릭스(matrix)
#-------------------------------------------------------------

# 네 개의 벡터 입력
st01 <- c(10, 60, 55, 34)
st02 <- c(10, 55, 58, 81)
st03 <- c(74, 50, 23, 53)
st04 <- c(0, 0, 4, 23)

st <- c(st01, st02, st03, st04) # 하나의 벡터로 저장
mat_st <- matrix(st) # matrix로 저장

mat_st <- matrix(st, nrow = 4, ncol = 4, byrow = T) # 조건을 다르게 저장

colnames(mat_st) <- c("attendence", "assignment", "midterm", "final") # column 이름
rownames(mat_st) <- c("st01", "st02", "st03", "st04") # row 이름

st.info <- data.frame(mat_st) # 데이터프레임으로 저장
st.info

#-------------------------------------------------------------
# 데이터프레임 (data.frame)
#-------------------------------------------------------------
# 네 개의 벡터 입력
st01 <- c(10, 60, 55, 34)
st02 <- c(10, 55, 58, 81)
st03 <- c(74, 50, 23, 53)
st04 <- c(0, 0, 4, 23)

df.st <- data.frame(st01, st02, st03, st04)

# st05 데이터를 추가하고 싶다면?
st05 <- data.frame(attendence = 90, assignment = 85, midterm = 78, final = 93)
df.st <- rbind(st.info, st05)

# 가산점이 빠졌네요?
point <- c(2, 6, 1, 7, 10)
point <- as.data.frame(point)
df.st <- cbind(df.st, point)

st.01.total <- sum(df.st[1, 1:5])
st.02.total <- sum(df.st[2, 1:5])
st.03.total <- sum(df.st[3, 1:5])
st.04.total <- sum(df.st[4, 1:5])
st.05.total <- sum(df.st[5, 1:5])

# 5명 학생의 평균점수
mean(st.01.total, st.02.total, st.03.total, st.04.total, st.05.total)
write_csv(df.st, "df.st.csv")

#-------------------------------------------------------------
# Exercise! Your turn.
# 1. DMwR이란 패키지를 설치하고 불러온다
# 2. DMwR 패키지에 내장된 데이터셋 목록을 불러온다
# 3. GSPCf라는 데이터을 데이터 프레임의 형태로 가져와서 변수명 SP500으로 저장한다. 
#    cf) 이 데이터셋은 미국 스탠다드 앤 푸어사에 의해 작성되는 주가지수로, 
#        동회사가 선정한 보통주 500 종목 대상으로 한다.
# 4. SP500 데이터셋의 처음 10개의 observation과 끝에 3개의 observation을 확인한다. 
# 5. SP500 데이터에서 10,013번째 데이터부터 10,022번째 데이터만 불러와서 변수명 SP0909로 저장한다.
# 6. SP0909.csv로 저장한다.
#-------------------------------------------------------------
