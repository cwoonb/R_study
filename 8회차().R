
library(tidyverse)
getwd()
setwd(dir = './data')
list.files(pattern = 'RDS')
stat <- readRDS(file = '2019_KBO_Hitter_Stats.RDS')
stat50 <- stat %>% filter(타석 > 50)

boxplot(x = stat50$OPS, main = '상자수염그림')
abline(h = quantile(x = stat50$OPS), 
       col = 'red', 
       lty = 3)

boxplot.stats(x = stat50$OPS)

qnts <- data.frame(stats = quantile(x = stat50$OPS)) %>% t()

colnames(x = qnts) <- c('Min', 'Qr1', 'Med', 'Qr3', 'Max')
qnts

par(mar = c(8, 4, 4, 2))
boxplot(x = stat50$OPS, main = '상자수염그림')

install.packages('plotrix')
library(plotrix)

addtable2plot(x = 0.30,
              y = 0.03, 
              table = qnts,
              bty = 'o',
              cex = 1, 
              xpad = 0.2,
              ypad = 1,
              display.rownames = TRUE,
              hlines = TRUE,
              vlines = TRUE)

boxplot(formula = OPS ~ 팀명,
        data = stat50,
        main = '팀별 OPS 분포')

abline(h = median(x = stat50$OPS),
       col = 'red', lwd = 2)


qnts <- stat50 %>% 
  group_by(팀명) %>% 
  summarise(Min = quantile(x = OPS, probs = 0.00),
            Qr1 = quantile(x = OPS, probs = 0.25),
            Med = quantile(x = OPS, probs = 0.50),
            Qr3 = quantile(x = OPS, probs = 0.75),
            Max = quantile(x = OPS, probs = 1.00))

qnts
colnames(x = qnts)

qnts[, 2:6] <- map_df(
  .x = qnts[, 2:6],
  .f = function(x) {
    x <- round(x = x, digits = 3L)
    return(x)
  })


qnts <- t(x = qnts)

colnames(x = qnts) <- qnts[1, ]
qnts <- qnts[-1, ]


boxplot(formula = OPS ~ 팀명,
        data = stat50,
        xaxt = 'n',
        xlab = NULL,
        main = '팀별 OPS 분포')

addtable2plot(x = -2,
              y = -0.30, 
              table = qnts,
              bty = 'o',
              cex = 0.8, 
              xpad = 0.2,
              ypad = 1,
              display.rownames = TRUE,
              hlines = TRUE,
              vlines = TRUE)



install.packages('packHV')
library(packHV)

par(mar = c(5, 4, 4, 2))
hist_boxplot(x = stat50$OPS, freq = TRUE)

dev.off()

plot(x = stat50$출루율,
     y = stat50$장타율,
     pch = 19, 
     cex = 1.2,
     col = 'gray70',
     main = '출루율 vs 장타율')

ops09 <- stat50 %>% filter(OPS >= 0.9)

points(x = ops09$출루율,
       y = ops09$장타율,
       pch = 19, 
       cex = 1.0,
       col = 'red')

text(x = ops09$출루율,
     y = ops09$장타율,
     labels = ops09$이름,
     pos = 2,
     cex = 1.2,
     font = 2,
     col = 'darkblue')

abline(v = mean(x = stat50$출루율),
       h = mean(x = stat50$장타율),
       col = 'red', 
       lty = 2)




plot(x = stat50$출루율,
     y = stat50$장타율,
     pch = 19, 
     cex = 1.2,
     col = 'gray70',
     main = '출루율 vs 장타율')

ops09 <- stat50 %>% filter(팀명 == 'LG')

points(x = ops09$출루율,
       y = ops09$장타율,
       pch = 19, 
       cex = 1.0,
       col = 'red')

text(x = ops09$출루율,
     y = ops09$장타율,
     labels = ops09$이름,
     pos = 2,
     cex = 1.2,
     font = 2,
     col = 'darkblue')

abline(v = mean(x = stat50$출루율),
       h = mean(x = stat50$장타율),
       col = 'red', 
       lty = 2)

reg <- lm(formula = 장타율 ~ 출루율, 
          data = stat50)

abline(reg = reg, 
       col = 'darkgreen',
       lwd = 2)



pairs(x = stat[, 5:11])

panel.cor <- function(x, y) {
  par(usr = c(0, 1, 0, 1))
  corr <- cor(x = x, y = y, 
              use = 'complete.obs') %>% 
    round(digits = 2L)
  text(x = 0.5, y = 0.5, labels = corr,
       cex = 2*abs(x = corr))
}

pairs(x = stat[, 5:11], 
      cex.labels = 2,
      upper.panel = panel.cor)

pairs(x = stat[, 5:11], 
      cex.labels = 2,
      lower.panel = panel.cor)



install.packages('corrplot')
library(corrplot)

corr <- cor(x = stat50[, 5:11])
corr

corrplot(corr = corr, method = 'ellipse')
corrplot(corr = corr, method = 'circle')
corrplot(corr = corr, method = 'square')
corrplot.mixed(corr = corr)


plot(x = sort(x = stat50$OPS),
     type = 'l',
     ylab = 'OPS',
     main = '선그래프')

qnts <- quantile(x = stat50$OPS, 
                 probs = c(0.95, 0.75, 0.50, 0.25, 0.05))
qnts

for (i in 1:length(x = qnts)) {
  abline(h = qnts[i], col = 'red', lty = 3)
  text(x = 5, 
       y = qnts[i], 
       labels = str_c(names(qnts)[i], ':', qnts[i]),
       pos = 3, cex = 0.8, font = 2)
}




teamHits <- stat %>% 
  group_by(팀명) %>% 
  summarise(인원 = n(),
            팀안타 = sum(안타)) %>% 
  mutate(평균안타 = round(x = 팀안타/인원,
                      digits = 2L)) %>% 
  arrange(desc(x = 평균안타))

bp <- barplot(height = teamHits$평균안타,
              names.arg = teamHits$팀명,
              col = 'orange',
              ylim = c(0, max(teamHits$평균안타)*1.1),
              main = '팀별 평균안타')

text(x = bp, 
     y = teamHits$평균안타,
     labels = teamHits$평균안타,
     pos = 3, 
     cex = 0.8, 
     col = 'black', 
     font = 2)




is.na(x = stat) %>% sum()
is.na(x = stat$BABIP) %>% sum()

map_int(.x = stat,
        .f = function(x) is.na(x) %>% sum())

is.na(x = stat) %>% mean()
map_dbl(.x = stat,
        .f = function(x) is.na(x) %>% mean())


install.packages('mice')
library(mice)
md.pattern(x = stat, rotate.names = TRUE)

NApcnt <- map_dbl(.x = stat,
                  .f = function(x) is.na(x) %>% mean())

locs <- which(x = NApcnt >= 0.05)
locs

stat <- stat %>% select(-locs)

varClass <- map_chr(.x = stat, .f = class)
locs <- which(x = varClass %in% c('integer', 'numeric'))
locs

imputation <- function(x) {
  x[is.na(x = x)] <- median(x = x, na.rm = TRUE)
  return(x)
}

impute1 <- map_df(.x = stat[, locs], 
                  .f = imputation)

is.na(x = impute1) %>% sum()


impute2 <- stat %>% 
  filter(complete.cases(stat))

impute2 <- stat %>% 
  filter(is.na(stat$타율) == FALSE)

impute2 <- stat %>% 
  filter(!is.na(stat$타율))

mulimp <- mice(data = stat, 
               m = 5, 
               method = 'pmm', 
               seed = 1234)

summary(object = mulimp)
mulimp$imp$타율

impute3 <- complete(data = mulimp, action = 1)
