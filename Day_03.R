
if (class(x = 1L) == 'integer') {
  print(x = '정수입니다.')
}

if (class(x = 1) == 'integer') print(x = '정수입니다.')


if (class(x = 2) == 'integer') {
  print(x = '정수입니다.')
} else {
  print(x = '정수가 아닙니다.')
}


a <- 4.2

if (class(x = a) == 'integer') {
  print(x = '정수입니다.')
} else if (class(x = a) == 'numeric') {
  print(x = '실수입니다.')
} else {
  print(x = '숫자가 아닙니다.')
}


major <- readline(prompt = '전공을 입력하세요: ')

if (grepl(pattern = '통계', x = major)) {
  print(x = 'R을 공부하세요.')
} else if (grepl(pattern = '컴퓨터', x = major)) {
  print(x = 'Python을 공부하세요.')
} else {
  print(x = '하고 싶은 거 공부하세요.')
}


score <- 92

if (score >= 80) {
  result <- '합격'
} else if (score >= 60) {
  result <- '재시험'
} else {
  result <- '불합격'
}

print(x = result)

set.seed(seed = 1234)
lotto <- sample(x = 45, 
                size = 6, 
                replace = FALSE)
print(x = lotto)


set.seed(seed = 1234)
lotto <- sample(x = 45, 
                size = 60000, 
                replace = TRUE)
print(x = lotto)
tbl <- table(lotto)
max(tbl)
tbl == max(tbl)
which(tbl == max(tbl))

sort(x = tbl, decreasing = TRUE)[1:6]



n <- nrow(x = iris)
set.seed(seed = 1234)
index <- sample(x = n, 
                size = n * 0.7, 
                replace = FALSE)

trainSet <- iris[index, ]
testSet <- iris[-index, ]


number <- sample(x = 10:99, size = 1)
guess <- readline(prompt = '숫자를 입력하세요: ')
if (guess == number) {
  print(x = '맞췄습니다.')
} else {
  print(x = '틀렸습니다.')
}

ifelse(test = 1:10 %% 2 == 1,
       yes = '홀수',
       no = '짝수')

df2 <- data.frame(num = 1:6,
                  char = letters[1:6])
df2

df2$gb <- ifelse(test = df2$num %% 2 == 1,
                 yes = '홀수',
                 no = '짝수')


set.seed(seed = 1234)
univ <- data.frame(math = sample(x = 40:99, size = 20, replace = TRUE))

univ$result <- ifelse(test = univ$math <= 59, yes = 'Fail', no ='Pass')

univ
table(univ$result)


set.seed(seed = 1234)
cust <- data.frame(age = sample(x = 15:65, 
                                size = 100, 
                                replace = TRUE))

cust$gb <- ifelse(test = cust$age <= 19, 
                  yes = '1.미성년', 
                  no = ifelse(test = cust$age <= 49, 
                              yes = '2.근로자', 
                              no = '3.은퇴자'))

table(cust$gb)


for (i in 1:10) {
  sqr <- i^2
  #print(x = sqr)
  sqr
}

for (i in 1:10) {
  if (i %% 2 == 1) next
  print(x = i)
}


for (i in 1:10) {
  if (i %% 2 == 1) {
    print(x = '홀수입니다.')
    next
  }
  print(x = i)
}


menu <- c('짜장면', '탕수육', '짬뽕', '전가복', '삭스핀', '깐풍기')

for (i in menu) {
  #print(x = i)
  cat('\n', i, '시킬까요?')
  if (i %in% c('짜장면', '짬뽕')) {
    cat(' --> 요리부터 주문합시다!')
  }
}

for (i in menu) {
  #print(x = i)
  cat('\n', i, '시킬까요?')
  if (!i %in% c('짜장면', '짬뽕')) {
    cat(' --> 그걸로 되겠어요?')
    next
  }
  cat(' --> 요리부터 주문합시다!')
}


for (i in 1:10) {
  sqr <- i^2
  print(x = sqr)
  sqrs <- c(sqrs, sqr)
}


for (i in 1:10) {
  sqr <- i^2
  print(x = sqr)
  tryCatch({
    sqrs <- c(sqrs, sqr)
  }, error = function(e) cat('에러가 발생했습니다.\n'))
}


for (i in 1:10) {
  sqr <- i^2
  print(x = sqr)
  tryCatch({
    sqrs <- c(sqrs, sqr)
  }, error = function(e) print(x = e))
}


i <- 10
while (i) {
  print(x = i)
  i <- i - 1
}

i <- 1
while (i) {
  print(x = i)
  i <- i + 1
}


j <- 1
while (j) {
  if (j > 5) break
  print(x = j)
  j <- j + 1
}


card <- 30000

while(card) {
  if (card <= 10000) {
    charge <- readline('충전하시겠습니까?[예/아니오]')
    if (charge == '예') {
      card <- card + 10000
      cat('아메리카노 한 잔 드립니다!')
      card <- card - 4100
      cat('현재 잔액은', card, '입니다.\n')
    } else {
      print('안녕히 가세요.')
    }
  } else {
    cat('아메리카노 한 잔 드립니다!')
    card <- card - 4100
    cat('현재 잔액은', card, '입니다.\n')
  }

}


Pythagoras <- function(a, b) {
  c <- sqrt(x = a^2 + b^2)
  #print(c)
  lst <- list(x = a, y = b, z = c)
  return(lst)
}

result <- Pythagoras(a = 3, b = 4)
result$x



vec <- 1:5
print(x = vec)
vec^2
sum(vec^2)
sqrt(sum(vec^2))

getVecLen <- function(vec) {
  vecLen <- sqrt(x = sum(vec^2))
  return(vecLen)
}

getVecLen(vec = 1:5)
getVecLen(vec = c(48, 39, 49, 60, 19))

guessHeight <- function(name, height = 173) {
  answer <- paste(name, '님의 키는', height, 'cm입니다', sep = ' ')
  return(answer)
}

guessHeight(name = '홍길동')
guessHeight(name = '홍길동', height = 185)



guessNumber <- function() {
  number <- sample(x = 10:99, size = 1)
  
  while(TRUE) {
    guess <- readline('두 자리 숫자를 입력하세요: ')
    
    if (guess == number) {
      cat('정답입니다.')
      break
    } else if (guess > number) {
      cat('>> 틀렸습니다. 더 작은 숫자를 입력하세요!\n\n')
    } else if (guess < number) {
      cat('>> 틀렸습니다. 더 큰 숫자를 입력하세요!\n\n')
    }
  }
}

guessNumber()



getwd()
list.files()
list.files(pattern = '.R')

setwd(dir = 'C:/Users/LearningSpoons04/Documents/Nano Degree/code')

# setwd(dir = './code')

list.files(pattern = '.R')

source(file = 'my_funs.R', encoding = 'utf-8')

guessNumber()



getwd()
list.files()
setwd(dir = '..')

getwd()
list.files()
setwd(dir = './Nano Degree')

getwd()
list.files()

rm(list = ls())
gc()

