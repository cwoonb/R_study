sen <- 'Hello world!'

print(x = sen)
print(sen)
sen

class(x = sen)
length(x = sen)
nchar(x = sen)


a <- 1; print(x = a)
b <- 2; print(x = b)
a <- b
b <- 3

1a <- 3
`1a` <- 3
print(x = 1a)
print(x = `1a`)

c(TRUE, FALSE)
c('TRUE', 'FALSE')
c(T, F)
c(1L, 2L, 3L)
c(1, 2, 3)
c('a', 'b', 'c', 'd', 'e')
c('가', '다', '나', '라', '하')

a <- c('가', '다', '나', '라', '하')
b <- c('a', 'b', 'c', 'd', 'e')
c <- c(a, b)

seq(1, 3, 1)
seq(from = 1, to = 3, by = 1)
seq(from = 3, to = 1, by = -1)
1:3
3:1
1:10000
10000:1
sum(1:10000)

seq(from = 1, to = 10, by = 0.5)
seq(from = 1, to = 10, length.out = 19)
seq(from = 80, to = 60, length.out = 365)

rep(x = 1:3, times = 5)
rep(x = 1:3, each = 5)

rep_len(x = 1:3, length.out = 9)
rep_len(x = 1:3, length.out = 10)

letters
LETTERS
class(x = letters)
length(x = letters)
nchar(x = letters)

terms <- c('I', 'am', 'a', 'girl')
class(x = terms)
length(x = terms)
nchar(x = terms)

paste('I', 'am', 'a', 'girl', sep = ' ')
paste(terms, terms, sep = ' ')
paste(terms, collapse = ' ')

grep(pattern = 'a', x = terms)
grepl(pattern = 'a', x = terms)
grep(pattern = 'a', x = terms, value = TRUE)

gsub(pattern = 'a', replacement = 'b', x = terms)
gsub(x = terms, pattern = 'a', replacement = 'b')
gsub('a', 'b', terms)
gsub( terms, 'a', 'b')
