
library(tidyverse)
library(readxl)

getwd()
list.files()
list.files(pattern = 'xlsx')

# setwd(dir = 'C:/Users/LearningSpoons04/Documents/Nano Degree/data')

setwd(dir = './data')
list.files(pattern = 'xlsx')

stat <- read_xlsx(path = '2019_KBO_Win.xlsx')


iris %>% 
  select(Sepal.Length, Petal.Length, Species) %>% 
  filter(Species %in% c('setosa', 'versicolor')) %>% 
  # slice(n = 1:50) %>% 
  group_by(Species) %>% 
  summarise(Count = n()) %>% 
  arrange(desc(x = Count))

stat %>% 
  select(팀명, 선수명, 경기)

stat %>% 
  select('팀명', '선수명', '경기')

stat %>% 
  select(c('팀명', '선수명', '경기'))

imsi <- stat %>% 
  select(팀명, 선수명, 경기)

stat %>% 
  select(팀명, 선수명, 경기) -> imsi

stat %>% select(1:3)
stat %>% select(2, 1, 3)
stat %>% select(c(2, 1, 3))


stat %>% slice(1:10)
stat %>% head(10)
stat %>% slice(11:20)

stat %>% slice(seq(from = 1, to = 300, by = 3))
stat %>% slice(팀명 == 'SK')

stat %>% distinct(팀명)
stat %>% distinct(팀명, .keep_all = TRUE)

detach('package:stats')
stat %>% filter(팀명 == 'SK')
stat %>% filter(팀명 == 'SK' & 경기 >= 100)
stat %>% filter(홈런 >= 20 & 도루 >= 20)
stat %>% filter(홈런 >= 20 | 도루 >= 20)

stat %>% 
  filter(between(x = 타율, 
                 left = 0.330, 
                 right = 0.350))

stat %>% 
  filter(타율 >= 0.330 & 타율 <= 0.350)

stat %>% 
  filter(between(x = 홈런, 
                 left = 20, 
                 right = 50))

stat <- stat %>% 
  rename(이름 = 선수명)

stat %>% 
  rename(경기횟수 = 경기,
         타석횟수 = 타석,
         안타횟수 = 안타) %>% 
  select(이름, 경기횟수, 타석횟수, 안타횟수)


stat %>% arrange(경기)
stat %>% arrange(경기, 타석)

stat %>% arrange(desc(x = 경기))
stat %>% arrange(desc(x = 경기), 타석)
stat %>% arrange(desc(x = 경기), desc(x = 타석))

stat %>% arrange(desc(x = 홈런), 삼진)


stat %>% 
  group_by(팀명) %>% 
  summarise(선수 = n()) %>% 
  arrange(desc(x = 선수))

stat %>% 
  group_by(팀명) %>% 
  summarise(팀홈런 = sum(홈런)) %>% 
  arrange(desc(x = 팀홈런))

stat %>% 
  group_by(팀명) %>% 
  summarise(최다홈런 = max(홈런)) %>% 
  arrange(desc(x = 최다홈런))

stat %>% 
  group_by(팀명, 이름) %>% 
  summarise(최다삼진 = max(삼진)) %>% 
  arrange(desc(x = 최다삼진))

stat %>% 
  filter(팀명 == 'LG' & 삼진 == 113) %>% 
  select(이름)

stat %>% 
  select(팀명, 이름, 삼진) %>% 
  arrange(desc(x = 삼진)) %>% 
  distinct(팀명, .keep_all = TRUE)


imsi <- stat %>% group_by(팀명)

stat %>% summarise(선수 = n())
imsi %>% summarise(선수 = n())

imsi %>% ungroup() %>% summarise(선수 = n())


stat %>% 
  select(이름, 출루율, 장타율) %>% 
  mutate(OPS = 출루율 + 장타율)

stat %>% 
  filter(타수 >= 100) %>% 
  mutate(볼삼비 = round(x = 볼넷/삼진,
                        digits = 3L)) %>% 
  select(이름, 볼넷, 삼진, 볼삼비) %>% 
  arrange(desc(x = 볼삼비))

stat %>% 
  mutate(타석차이 = 타석 - 타수) %>% 
  arrange(desc(x = 타석차이)) %>% 
  select(팀명, 이름, 타석, 타수, 타석차이, 볼넷)


stat %>% 
  select(팀명, 이름, 안타, 홈런) %>% 
  filter(안타 >= 100) %>% 
  mutate(홈런비중 = round(x = 홈런/안타, 
                          digits = 3L)) %>% 
  arrange(desc(x = 홈런비중))


stat %>% 
  select(팀명, 이름, 타석) %>% 
  mutate(규정타석 = if_else(condition = 타석 >= 144 * 3.1,
                            true = '이상',
                            false = '미만')) %>% 
  group_by(팀명, 규정타석) %>% 
  summarise(구분 = n())



stat %>% 
  select(팀명, 이름, 타석) %>% 
  mutate(규정타석 = ifelse(test = 타석 >= 144 * 3.1,
                           yes = '이상',
                           no = '미만')) %>% 
  group_by(팀명, 규정타석) %>% 
  summarise(구분 = n())


stat %>% 
  select(이름, 홈런) %>% 
  mutate(타입 = case_when(홈런 >= 20 ~ '거포',
                          홈런 >= 10 ~ '주전',
                          홈런 >= 0 ~ '똑딱이'))


stat %>% 
  group_by(팀명) %>% 
  summarise(인원 = n(),
            팀홈런 = sum(홈런)) %>% 
  mutate(평균홈런 = round(x = 팀홈런/인원,
                          digits = 2L)) %>% 
  arrange(desc(x = 평균홈런))


stat %>% 
  group_by(팀명) %>% 
  summarise(팀타수 = sum(타수),
            팀안타 = sum(안타)) %>% 
  mutate(팀타율 = round(x = 팀안타/팀타수,
                        digits = 3L)) %>% 
  arrange(desc(x = 팀타율))


stat %>% 
  group_by(팀명) %>% 
  summarise(팀볼넷 = sum(볼넷),
            팀삼진 = sum(삼진)) %>% 
  mutate(볼삼비 = round(x = 팀볼넷/팀삼진,
                       digits = 3L)) %>% 
  arrange(desc(x = 볼삼비))



employ <- data.frame(
  이름 = c('김하나', '이하늬', '박찬우', '최진상'),
  나이 = c(24, 35, 28, 45),
  직급 = c('주임', '과장', '대리', '부장')
)

office <- data.frame(
  이름 = c('김하나', '이하늬', '최진상', '강민희'),
  내선 = c('0101', '2233', '9999', '5678'),
  부서 = c('인사', '총무', '전략', '영업')
)

detail <- data.frame(
  직원명 = c('김하나', '박찬우', '최진상', '강민희'),
  나이 = c(24, 31, 45, 34),
  혈액형 = c('A', 'B', 'O', 'AB'),
  동아리 = c('독서', '등산','와인', '재테크')
)


inner_join(x = employ, y = office, by = '이름')
full_join(x = employ, y = office, by = '이름')
left_join(x = employ, y = office, by = '이름')
right_join(x = employ, y = office, by = '이름')


left_join(x = employ, y = detail, 
          by = c('이름' = '직원명'))

left_join(x = employ, y = detail, 
          by = c('이름' = '직원명', '나이'))


getwd()
list.files()
list.files(pattern = 'csv')
list.files(pattern = 'KBO')

guess_encoding(file = 'KBO Team Info(EUC-KR).csv')
guess_encoding(file = 'KBO Team Info(UTF-8).csv')

teamInfo <- read.csv(file = 'KBO Team Info(EUC-KR).csv',
                     fileEncoding = 'EUC-KR',
                     stringsAsFactors = FALSE)

teamInfo <- read.csv(file = 'KBO Team Info(UTF-8).csv',
                     fileEncoding = 'UTF-8',
                     stringsAsFactors = FALSE)

imsi <- left_join(x = stat, 
                  y = teamInfo, 
                  by = '팀명')

table(stat$팀명)
table(teamInfo$팀명)

teamInfo$팀명[teamInfo$팀명 == 'kt'] <- 'KT'
stat$팀명[stat$팀명 == 'Hero'] <- '키움'

table(stat$팀명)
table(teamInfo$팀명)

imsi <- left_join(x = stat, 
                  y = teamInfo, 
                  by = '팀명')

