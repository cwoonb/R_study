
a <- c(1, 2)
class(x = a)
a

b <- c(1L, 2L)
class(x = b)
b

sum(x = a)
sum(x = b)

c <- c('hello', 'world')
class(x = c)
sum(x = c)

d <- c(FALSE, TRUE)
class(x = d)
sum(d)

x <- c(F, T, T, T, F, F, T, F, T, F, F)
sum(x)

as.integer(x = d)

e <- as.factor(x = c)
class(x = e)
e
c

as.integer(x = e)
sum(e)
sum(as.integer(x = e))


letters[1]
letters[c(1, 3, 5, 7, 9, 11, 13, 15)]
letters[seq(from = 1, to = 26, by = 2)]

loc <- seq(from = 3, to = 26, by = 3)
letters[loc]
LETTERS[loc]

letters[loc] <- LETTERS[loc]
letters


vec <- c('한국', '일본', '중국', '미국', '중국', '한국', '미국', '한국', '일본')

fct1 <- factor(x = vec)
fct1
as.integer(x = fct1)

fct2 <- factor(x = vec, 
               levels = c('한국', '미국', '중국', '일본'))
fct2

fct3 <- factor(x = vec, 
               levels = c('한국', '미국', '중국', '일본'),
               labels = c('대한민국', '미합중국', '중화민국', '일본나라'))
fct3

as.factor()

vec[9] <- '대만'
vec

fct1[9] <- '대만'
fct1

fct4 <- as.character(x = fct1)
fct4
fct4[9] <- '대만'
fct4
as.factor(x = fct4)

fct1
levels(fct1) <- c('한국', '미국', '중국', '일본', '대만')
fct1
fct1[9] <- '대만'
fct1


f <- c(d, e)
f
class(x = f)

f <- c(f, 3)
f
class(x = f)

f <- c(f, '4')
f
class(x = f)

sum(f)
as.integer(f)
as.numeric(f)
f


letters[1]

a <- c('a', 'b', 'c', 'd', 'e')
a
a[c(1, 3, 5)]
a[c(TRUE, FALSE, TRUE, FALSE, TRUE)]

iris[iris$Sep4al.Length >= 5, ]
mtcars[mtcars$am == 1, ]

1:5
a <- letters[1:5]
a
b <- LETTERS[6:10]
b

a
a[]
c()
c <- letters[1:10]
c[1]

a[-1]
a[-c(1,2)]
b <- a[-c(1,2)]
b

a[1] <- 'A'
a
a[2] <- 'B'
a

a <- c(0, 2, 4)
b <- c(1, 2, 3)
a + b
a - b
a * b
a / b

a %% b
a %/% b
a ^ b
(1:10)^2

c <- seq(from = 1, to = 11, by = 2)
d <- seq(from = 3, to = 12, by = 4)
a
c
a + c

a
b
a > b
a >= b
a < b
a <= b
a == b
a != b

a
b
a & b
a | b
!a
!b

A <- matrix(data = 1:12, nrow = 3)
A
class(x = A)


B <- matrix(data = 1:12, nrow = 3, byrow = T)
B

C <- matrix(data = 1:12,
            nrow = 3,
            ncol = 4,
            dimnames = list(letters[1:3],
                            LETTERS[4:7]))
C

A
A[1, ]
A[1:2, ]
A[, 1]
A[, 1:2]
A[1, 1]
A[2, 3]
A[1:2, 1:2]

A[-1, ]
A[-c(1, 2), ]
A[, -1]
A[, -c(1, 2)]
A[-1, -1]

A
A[1, ] <- 95:98
A
A[, 1] <- 31:33
A

A[1, 1] <- 55
A

A[1, 1] <- 55.5
A

A[1, 1] <- '55.5'
A
A <- as.numeric(A)
matrix(data = A, nrow = 3)

c <- c('hello', 'world')
e <- c('this', 'is', 'me')

paste(c, e)
paste(c, collapse = ' ')
paste(e, collapse = ' ')
paste(paste(c, collapse = ' '),
      paste(e, collapse = ' '))

library(tidyverse)
str_sub(string = c, start = 1, end = 3)
str_c(c, e, sep = ' ')

options('scipen')
options('digits')

round(1.2, 2)

format(round(1.2, 2), nsmall = 2)
# [1] "1.20"
format(round(1, 2), nsmall = 2)
# [1] "1.00"
format(round(1.1234, 2), nsmall = 2)




lst <- list(a = 'a', b = 'b', c = 'c')
lst
unlist(lst)


num <- 1:5
char <- LETTERS[6:10]
logi <- rep(x = c(T, F), each = 3)
lst1 <- list(a = num, b = char, c = logi)
str(object = lst1)

lst2 <- list(num, char, logi, lst1)
str(object = lst2)
class(x = lst2)

lst1[[1]]
lst1$a

lst2[[1]]
lst2$a

lst2[2]

lst2[[4]]$b[2:4]
lst2[[4]][[2]][2:4]

matrix(data = 1:12, nrow = 3)

options('stringsAsFactors')

df <- data.frame(num, char, logi)
num <- 1:6
char <- letters[1:6]

df1 <- data.frame(num, char, logi)
str(object = df1)
View(x = df1)

df2 <- data.frame(num, char, logi, 
                  stringsAsFactors = TRUE)
str(object = df2)

df2
df2[1, ]
df2[1:2, ]
df2[, 1]
df2[, c(1, 3)]
df2[, -c(1, 3)]

class(df2)
class(df2[1, ])
class(df2[, 1])
class()
class()

lst2

df2[, 1]
df2[, 'num']
df2[, c('num', 'char')]
df2$num

df2['num']
df2[['num']]

df2[-1, ]
df2[, -1]
df2[-1, -1]
df2

df3 <- df2[-1, -1]
df3

df2$char <- as.character(df2$char)
df2$char <- LETTERS[1:6]
df2$char

df2$char[1:3]
df2$char[1:3] <- c('가', '나', '다')

df2$char
