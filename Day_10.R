
library(tidyverse)
getwd()
setwd(dir = './data')
list.files(pattern = 'RDS')
df <- readRDS(file = 'Toyota.RDS')

cor(x = df$Age, y = df$Price, method = 'pearson')
cor(x = df$Age, y = df$Price, method = 'spearman')

corrtest <- cor.test(x = df$Age, y = df$Price)
corrtest$p.value


varClass <- map_chr(.x = df, .f = class)
varClass

locs <- which(x = varClass %in% c('integer', 'numeric'))
locs

df[, locs]
map(.x = df[, locs], .f = function(x) cor.test(x = x, y = df$Price))

result <- data.frame(id = locs, corr = NA, pval = NA)
imsi <- df[, locs]
for (i in 1:length(x = locs)) {
  corrtest <- cor.test(x = imsi[, i], y = df$Price)
  result$corr[i] <- corrtest$estimate
  result$pval[i] <- corrtest$p.value
}

locs <- which(x = result$pval < 0.05)
locs
imsi <- imsi %>% select(locs)


table(df$MetColor)
by(data = df$Price, INDICES = df$MetColor, FUN = shapiro.test)
wilcox.test(formula = Price ~ MetColor, data = df)
var.test(formula = Price ~ MetColor, data = df)
t.test(formula = Price ~ MetColor, data = df, var.equal = FALSE)

table(df$FuelType)
by(data = df$Price, INDICES = df$FuelType, FUN = shapiro.test)
kruskal.test(formula = Price ~ FuelType, data = df)

install.packages('lawstat')
library(lawstat)
levene.test(y = df$Price, group = df$FuelType, location = 'mean')
by(data = df$Price, INDICES = df$FuelType, FUN = sd)
oneway.test(formula = Price ~ FuelType,
            data = df, 
            var.equal = FALSE)

TukeyHSD(x = aov(formula = Price ~ FuelType, data = df))


library(gmodels)

if(require(gmodels) == FALSE) {
  install.packages('gmodels')
  require(gmodels)
} else {
  require(gmodels)
}

CrossTable(x = df$MetColor, y = df$Automatic)
chisq.test(x = df$MetColor, y = df$Automatic)


df <- df %>% select(-FuelType, -Automatic)

getwd()
saveRDS(object = df, file = 'Toyota.RDS')

