
library(tidyverse)
library(readxl)

getwd()
list.files(pattern = 'KBO')

stat <- read_xlsx(path = '2019_KBO_Win.xlsx')
stat <- stat %>% rename(이름 = 선수명)

longDf <- stat %>% 
  slice(1:10) %>% 
  select(이름, 경기, 타석, 타수, 안타, 홈런) %>% 
  gather(key = '구분', value = '스탯', -이름, na.rm = TRUE) %>% 
  arrange(이름, 구분)


# longDf <- longDf[-1, ]
longDf <- longDf %>% slice(-1)

wideDf <- longDf %>% 
  spread(key = '구분', value = '스탯', fill = NA)


longDf <- stat %>% 
  slice(11:20) %>% 
  select(이름, 타율, 출루율, 장타율, OPS) %>% 
  gather(key = '스탯', value = '점수', -이름, na.rm = TRUE) %>% 
  arrange(이름, 스탯)

wideDf <- longDf %>% 
  spread(key = '스탯', value = '점수', fill = NA)


set.seed(seed = 1234)
nums <- sample(x = 1:10, size = 100, replace = TRUE)
locs <- sample(x = 1:100, size = 10, replace = FALSE)
nums[locs] <- NA
nums
mean(nums, na.rm = TRUE)
sum(nums, na.rm = TRUE)


map(.x = stat[, 3:19], .f = mean, na.rm = TRUE)

stat %>% 
  select(3:19) %>% 
  map(.f = mean, na.rm = TRUE)

lapply(X = stat[, 3:19], FUN = mean, na.rm = TRUE)

map_if(.x = stat, 
       .p = is.numeric, 
       .f = mean, na.rm = TRUE)

is.numeric(x = stat$이름)
is.numeric(x = stat$팀명)
is.numeric(x = stat$경기)
is.numeric(x = stat$타율)


map_lgl(.x = stat, .f = is.numeric)
map_int(.x = stat, .f = is.numeric)
map_dbl(.x = stat, .f = is.numeric)
map_chr(.x = stat, .f = is.numeric)
map_chr(.x = stat, .f = class)

map_df(.x = stat[, 3:19], .f = mean, na.rm = TRUE)
map_dbl(.x = stat[, 3:19], .f = mean, na.rm = TRUE)
map_chr(.x = stat[, 3:19], .f = mean, na.rm = TRUE)


map(.x = stat[, 3:19], .f = mean, na.rm = TRUE) %>% 
  map_dfc(.f = ~ .) %>% 
  t() %>% 
  as.data.frame()

map(.x = stat[, 3:19], .f = mean, na.rm = TRUE) %>% 
  map_dfr(.f = ~ data.frame(평균 = .))


stat$팀명 <- as.factor(x = stat$팀명)
stat$팀명

map_chr(.x = stat, .f = class)

stat[, 3:12] <- map_df(.x = stat[, 3:12],
                       .f = as.integer)



str_c(stat$팀명, stat$이름)
str_c(stat$팀명, stat$이름, sep = ':')
str_c(stat$팀명, stat$이름, sep = '-')
str_c(stat$이름, collapse = ' ')

stat$선수 <- str_c(stat$팀명, stat$이름, sep = ' ')
stat$선수

str_split(string = stat$선수, pattern = ' ')
str_split(string = stat$선수, pattern = ' ', simplify = TRUE) %>% 
  as.data.frame()


str_detect(string = stat$팀명, pattern = 'SK')
str_detect(string = stat$팀명, pattern = '와이번스')
str_detect(string = stat$이름, pattern = '^최') %>% 
  sum()

str_detect(string = stat$이름, pattern = '^박') %>% 
  sum()

str_sub(string = stat$이름, start = 1, end = 1) %>% 
  table() %>% 
  sort(decreasing = TRUE)

str_detect(string = stat$이름, pattern = '배$') %>% 
  sum()

sen <- c('가나다', '나가라', '다나가', '마바사')
str_remove_all(string = sen, pattern = '가')
str_remove_all(string = sen, pattern = '나')
str_remove_all(string = sen, pattern = '[가나]')
str_remove_all(string = sen, pattern = '[가나다]')
str_remove_all(string = sen, pattern = '[가-다]')
str_remove_all(string = sen, pattern = '[가-힣]')

str_remove(string = stat$이름, 
           pattern = '^[가-힣]') %>% 
  table() %>% 
  sort(decreasing = TRUE)


sen <- '오늘 오전 내용은 쉽고 오후 내용은 어렵습니다.'

str_remove(string = sen, pattern = ' ')
str_remove_all(string = sen, pattern = ' ')


str_replace(string = stat$이름, 
            pattern = '^양',
            replacement = '강')

str_replace(string = stat$이름, 
            pattern = '^김',
            replacement = '곰')

str_replace(string = sen, 
            pattern = ' ', 
            replacement = '_')

str_replace_all(string = sen, 
                pattern = ' ',
                replacement = '_')



str_extract(string = stat$이름, 
            pattern = '^[가-힣]')

str_extract(string = sen, pattern = '내용')
str_extract_all(string = sen, 
                pattern = '내용')
str_extract_all(string = sen, 
                pattern = '내용',
                simplify = TRUE)

str_extract_all(string = sen, 
                pattern = '오전|오후',
                simplify = TRUE)

str_extract_all(string = sen, 
                pattern = '오[전후]',
                simplify = TRUE)

str_extract_all(string = sen, 
                pattern = '오.',
                simplify = TRUE)

str_count(string = sen, pattern = '내용')
str_length(string = sen)
nchar(x = sen)

sen <- '\n 오늘 오전 내용은 쉽고 오후 내용은 어렵습니다.\t'

cat(sen)
str_trim(string = sen)


table(stat$팀명)

stat$팀명 <- str_replace(string = stat$팀명,
                         pattern = 'Hero',
                         replacement = '키움')

table(stat$팀명)

stat$팀명 <- as.factor(x = stat$팀명)


stat$이름

str_extract(string = sen, pattern = '[가-힣 ]*')

stat$이름 <- str_remove(string = stat$이름,
                        pattern = '\\*$')

stat$이름

stat$이름 <- str_remove(string = stat$이름,
                      pattern = '\\(\\)')


nums <- c(1, 2, 3, 1, 3, 4, 2, 4, 5, 6, 3, 5)
duplicated(x = nums)
duplicated(x = nums) %>% sum()


imsi <- unique(x = stat)
imsi <- stat %>% filter(duplicated(x = stat) == FALSE)
imsi <- stat %>% filter(duplicated(x = stat$팀명) == FALSE)

saveRDS(object = stat,
        file = '2019_KBO_Hitter_Stats.RDS')

'^[가-힣]'
'^[^가-힣]'


strs <- c('abCD', '1234', '가나다라', 'ㅋㅎㅜㅠ', '\r\n\t\\', '-_,./?')

nchar(x = strs)

str_extract_all(string = strs, 
                pattern = '.',
                simplify = TRUE)

str_extract_all(string = strs, pattern = '\\w')
str_extract_all(string = strs, pattern = '\\d')
str_extract_all(string = strs, pattern = '\\s')
str_extract_all(string = strs, pattern = 'a|b')
str_extract_all(string = strs, pattern = '[ab]')
str_extract_all(string = strs, pattern = '[a-z]')
str_extract_all(string = strs, pattern = '[A-Z]')
str_extract_all(string = strs, pattern = '[0-9]')
str_extract_all(string = strs, pattern = '[ㄱ-ㅎ]')
str_extract_all(string = strs, pattern = '[ㅏ-ㅣ]')
str_extract_all(string = strs, pattern = '[ㄱ-ㅣ]')
str_extract_all(string = strs, pattern = '[가-힣]')
str_extract_all(string = strs, pattern = '[^가-힣]')


nums <- c('1', '23', '456', '7890')
str_extract(string = nums, pattern = '\\d+')
str_extract(string = nums, pattern = '\\d*')
str_extract(string = nums, pattern = '\\d{2}')
str_extract_all(string = nums, pattern = '\\d{2}')

str_extract(string = nums, pattern = '\\d{3,4}')
str_extract(string = nums, pattern = '\\d{4,}')


str <- '<p>이것은<br>HTML<br>입니다</p>'
str_extract_all(string = str, pattern = '<.+>')
str_extract_all(string = str, pattern = '<.+?>')

str <- '우리집 강아지는 (복슬강아지)입니다.'
str_extract(string = str, pattern = '(.+)')
str_extract(string = str, pattern = '\\(.+\\)')

strs <- c('가나다', '나가다', '다나가')
str_extract(string = strs, pattern = '가')
str_extract(string = strs, pattern = '^가')
str_extract(string = strs, pattern = '가$')
