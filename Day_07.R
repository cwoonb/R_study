
library(tidyverse)
getwd()
setwd(dir = './data')
list.files(pattern = 'RDS')
stat <- readRDS(file = '2019_KBO_Hitter_Stats.RDS')

teamHits <- stat %>% 
  group_by(팀명) %>% 
  summarise(인원 = n(),
            팀안타 = sum(안타)) %>% 
  mutate(평균안타 = round(x = 팀안타/인원,
                          digits = 2L)) %>% 
  arrange(desc(x = 평균안타))

mean(x = stat$안타, na.rm = TRUE)
mean(x = stat$안타, na.rm = TRUE, trim = 0.05)
mean(x = stat$안타, na.rm = TRUE, trim = 0.10)

install.packages('matrixStats')
library(matrixStats)

weighted.mean(x = teamHits$평균안타,
              w = teamHits$인원)
mean(x = stat$안타, na.rm = TRUE)
mean(x = teamHits$평균안타)

median(x = stat$안타)

tbl <- table(stat$안타)
names(x = tbl)
max(tbl)
tbl == max(tbl)
names(x = tbl)[tbl == max(tbl)]

range(stat$안타)
min(stat$안타)
max(stat$안타)
max(stat$안타) - min(stat$안타)
range(stat$안타) %>% diff()


obj <- stat$타율
range(obj, na.rm = TRUE)
min(obj, na.rm = TRUE)
max(obj, na.rm = TRUE)
max(obj, na.rm = TRUE) - min(obj, na.rm = TRUE)
range(obj, na.rm = TRUE) %>% diff()


quantile(x = stat$안타, 
         probs = seq(from = 0, to = 1, by = 0.25))

quantile(x = stat$안타, 
         probs = c(0.1, 0.9))

quantile(x = stat$안타, 
         probs = seq(from = 0, to = 1, by = 0.1))

IQR(x = stat$안타)

mad(x = stat$안타)


install.packages('moments')
library(moments)
skewness(x = stat$안타)
kurtosis(x = stat$안타)

set.seed(1234)
kurtosis(rnorm(n = 100000, mean = 0, sd = 1))


set.seed(seed = 1234)
heights <- rnorm(n = 5000, mean = 172.4, sd = 5.7)
skewness(x = heights)
kurtosis(x = heights)
shapiro.test(x = heights)

map_dbl(.x = stat[, 3:19], .f = mean, na.rm = TRUE)
map_dbl(.x = stat[, 3:19], .f = sd, na.rm = TRUE)

summary(object = stat)

install.packages('psych')
library(psych)
describe(x = stat[, 3:19])


cov(x = stat$타수, y = stat$안타)
cor(x = stat$타수, y = stat$안타)

cor.test(x = stat$타수, y = stat$안타)
plot(x = stat$타수,
     y = stat$안타,
     pch = 19,
     col = 'gray70')

abline(v = mean(stat$타수),
       h = mean(stat$안타),
       col = 'red', 
       lty = 2)



range(x = stat$타석)
breaks <- seq(from = 0, to = 650, by = 50)
breaks

cuts <- cut(x = stat$타석, 
            breaks = breaks,
            include.lowest = TRUE)

stat$타석[1:10]
cuts[1:10]

cuts %>% 
  table() %>% 
  prop.table() %>% 
  round(digits = 4L) * 100

stat50 <- stat %>% filter(타석 > 50)

hist(x = stat50$타석,
     freq = TRUE, 
     breaks = breaks,
     ylim = c(0, 40),
     col = 'pink',
     border = 'pink',
     labels = TRUE, 
     main = '타석 히스토그램',
     xlab = '타석',
     ylab = '빈도수')


range(x = stat50$OPS)
breaks <- seq(from = 0.20, to = 1.1, by = 0.05)
hist(x = stat50$OPS,
     breaks = breaks,
     col = 'gray90',
     labels = TRUE)

hist(x = stat50$OPS,
     freq = FALSE, 
     breaks = breaks, 
     col = 'white')

lines(x = density(x = stat50$OPS),
      col = 'red',
      lwd = 2)
