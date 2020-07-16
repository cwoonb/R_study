
library(tidyverse)

set.seed(seed = 1234)
hgts <- rnorm(n = 100000, mean = 170, sd = 15)
hgts <- rnorm(n = 100000, mean = 170, sd = 10)
hgts <- rnorm(n = 100000, mean = 170, sd = 5)

range(hgts)
breaks <- seq(from = 100, to = 230, by = 1)
hist(x = hgts, breaks = breaks)

pnorm(q = 180, mean = 170, sd = 15)
pnorm(q = 180, mean = 170, sd = 10)
pnorm(q = 180, mean = 170, sd = 5)
pnorm(q = 186, mean = 175.6, sd = 5.3)

qnorm(p = 0.7475075, mean = 170, sd = 15)
qnorm(p = 0.80, mean = 175.6, sd = 5.3)

dnorm(x = 180, mean = 170, sd = 15)
dnorm(x = 180, mean = 170, sd = 10)

scale(x = 180, center = 170, scale = 15)
scale(x = 180, center = 170, scale = 10)
scale(x = 180, center = 170, scale = 5)



df <- read.csv(file = 'https://bit.ly/toyota_price')
str(object = df)
summary(object = df)
head(x = df, n = 10)

df[, c(4, 6:7)] <- map_df(.x = df[, c(4, 6:7)], .f = as.factor)
summary(object = df)


hist(x = df$Price)
boxplot(x = df$Price)

plot(x = df$Age, 
     y = df$Price)

plot(formula = Price ~ Age, 
     data = df, 
     pch = 19, 
     col = 'gray70')

plot(formula = Price ~ KM, 
     data = df, 
     pch = 19, 
     col = 'gray70')

plot(formula = Price ~ Weight, 
     data = df, 
     pch = 19, 
     col = 'gray70')

abline(v = 1350, col = 'red', lty = 3)

plot(formula = Price ~ HP, 
     data = df, 
     pch = 19, 
     col = 'gray70')

avg <- df %>% 
  group_by(HP) %>% 
  summarise(m = mean(x = Price))

points(x = avg$HP, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)


plot(formula = Price ~ CC, 
     data = df, 
     pch = 19, 
     col = 'gray70')

avg <- df %>% 
  group_by(CC) %>% 
  summarise(m = mean(x = Price))

points(x = avg$CC, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)


plot(formula = Price ~ Doors, 
     data = df, 
     pch = 19, 
     col = 'gray70')

avg <- df %>% 
  group_by(Doors) %>% 
  summarise(m = mean(x = Price))

points(x = avg$Doors, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)


boxplot(formula = Price ~ FuelType, 
        data = df)

avg <- df %>% 
  group_by(FuelType) %>% 
  summarise(m = mean(x = Price))

points(x = avg$FuelType, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)


boxplot(formula = Price ~ MetColor, 
        data = df)

avg <- df %>% 
  group_by(MetColor) %>% 
  summarise(m = mean(x = Price))

points(x = avg$MetColor, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)


boxplot(formula = Price ~ Automatic, 
        data = df)

avg <- df %>% 
  group_by(Automatic) %>% 
  summarise(m = mean(x = Price))

points(x = avg$Automatic, 
       y = avg$m, 
       pch = 19, 
       col = 'red',
       cex = 1.2)



df <- df %>% 
  filter(HP <= 120 & Weight <= 1350 & Doors >= 3)
