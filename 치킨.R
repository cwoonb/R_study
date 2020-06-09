library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()

library(readxl)

ck <- read_excel("C:/Rstudy/치킨집_가공.xlsx")
head(ck)

addr <- substr(ck$소재지전체주소, 11, 16)
head(addr)

addr_num <- gsub("[0-9]", "", addr)
addr_trim <- gsub(" ", "", addr_num)
head(addr_trim)

library(dplyr)

addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

install.packages("treemap")
library(treemap)

treemap(addr_count, index = ".", vSize = "Freq", title = "서울문구 동별 치킨집 분포")

arrange(addr_count, desc(Freq)) %>% head()
