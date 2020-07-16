
length(letters)
nchar(letters)

str(object = iris)
iris[, 1:4]

apply(X = iris[, 1:4], MARGIN = 1, FUN = sum)
apply(X = iris[, 1:4], MARGIN = 2, FUN = sum)

apply(X = iris[, 1:4], MARGIN = 1, FUN = mean)
apply(X = iris[, 1:4], MARGIN = 2, FUN = mean)

for (i in 1:4) {
  print(mean(iris[, i]))
}


lst <- list(iris$Sepal.Length, iris$Petal.Length)
sapply(X = lst, FUN = mean)
lapply(X = lst, FUN = mean)

range(iris[, 1])
range(iris[, 2])

sapply(X = iris[, 1:4], FUN = range)
lapply(X = iris[, 1:4], FUN = range)



x <- iris[, 1]
length(x[x >= 5])

sapply(X = iris[, 1:4], 
       FUN = function(x) {
         length(x[x >= 5])
       })

apply(X = df, MARGIN = 2, FUN = sum)
sapply(X = df, FUN = sum)

table(iris$Species)

tapply(X = iris$Petal.Length,
       INDEX = iris$Species, 
       FUN = mean)

sapply(X = iris[, 1:4], 
       FUN = function(x) {
         tapply(X = x,
                INDEX = iris$Species, 
                FUN = mean)
       })


set.seed(seed = 1234)
univ <- data.frame(
  math = sample(x = 50:99, size = 20, replace = TRUE),
  eng = sample(x = 50:99, size = 20, replace = TRUE),
  kor = sample(x = 50:99, size = 20, replace = TRUE),
  com = sample(x = 50:99, size = 20, replace = TRUE))

system.time(expr = for (i in 1:4) print(mean(univ[, i])))

system.time(expr = sapply(X = univ, FUN = mean))

options(scipen = 1000)


sapply(X = univ, FUN = function(x) {
  ifelse(test = x <= 69, yes = 'Yes', no = 'No')
})


getGrade <- function(x) {
  if (x >= 90) {
    grade <- 'A'
  } else if (x >= 80) {
    grade <- 'B'
  } else if (x >= 70) {
    grade <- 'C'
  } else {
    grade <- 'F'
  }
  return(grade)
}

getGrade(x = 100)
getGrade(x = 69)

sapply(X = univ, FUN = function(x) {
  grade <- c()
  for (i in 1:length(x)) {
    grade[i] <- getGrade(x = x[i])
  }
  return(grade)
})




getwd()
setwd(dir = './data')

# install.packages('writexl')
# library(writexl)
writexl::write_xlsx(x = iris, path = 'test.xlsx')
write.csv(x = iris, file = 'test.csv')
write.table(x = iris, file = 'test.txt')
saveRDS(object = iris, file = 'test.RDS')
save(list = c('iris'), file = 'test.RDA')

# install.packages('readxl')
obj <- readxl::read_xlsx(path = 'test.xlsx')
obj <- read.csv(file = 'test.csv')
obj <- read.table(file = 'test.txt')
obj <- readRDS(file = 'test.RDS')
load(file = 'test.RDA')

# install.packages('readr')
readr::guess_encoding(file = 'https://bit.ly/apt_price_2019_csv')

readr::guess_encoding(file = 'https://www.naver.com')
readr::guess_encoding(file = 'https://www.daum.net')
readr::guess_encoding(file = 'https://www.president.go.kr')

readr::guess_encoding(file = 'https://www.assembly.go.kr')

readr::guess_encoding(file = 'https://finance.naver.com')

apt <- read.csv(file = 'https://bit.ly/apt_price_2019_csv',
                fileEncoding = 'UTF-8')

# install.packages('data.table')
library(data.table)

system.time(expr = huge <- read.csv('huge.csv'))
system.time(expr = huge <- fread('huge.csv'))


options('max.print')
options('max.print' = 1000)
iris

iris[1]

library(tibble)
imsi <- as_tibble(x = iris)
imsi
imsi[1]


colnames(x = iris)[c(1, 3)]

library(dplyr)
iris %>% 
  select(-Sepal.Length, -Petal.Length) %>% 
  group_by(Species) %>% 
  summarise(avg = mean(Sepal.Width))


list.files(pattern = '2019_KBO')

stat <- readRDS(file = '2019_KBO_Win.RDS')
class(x = stat)
str(object = stat)
dim(x = stat)
nrow(x = stat)
ncol(x = stat)

print(x = stat)
head(x = stat, n = 10)
tail(x = stat, n = 10)
View(x = stat)

rownames(x = stat)
colnames(x = stat)

imsi <- stat[-(1:5), ]
imsi[218, ]

rownames(x = imsi) <- NULL
colnames(x = stat)[1] <- '이름'

summary(object = stat)

table(x = stat$팀명)
prop.table(x = table(x = stat$팀명))
round(x = prop.table(x = table(x = stat$팀명)), 
      digits = 3)

# install.packages('tidyverse')
library(tidyverse)

stat$팀명 %>% 
  table() %>% 
  prop.table() %>% 
  round(digits = 3L) * 100


tbl <- table(stat$팀명)
prop <- prop.table(tbl)
round(prop, 3)
