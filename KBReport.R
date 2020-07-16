
library(tidyverse)
library(httr)
library(rvest)

res <- POST(url = 'http://www.kbreport.com/leader/list/ajax',
            body = list('rows' = 20,
                        'order' = 'oWAR',
                        'orderType' = 'DESC',
                        'year_from' = 2019,
                        'year_to' = 2019,
                        'gameType' = 'R',
                        'tpa_count' = 0,
                        'page' = 1),
            encode = 'form')

print(x = res)

Sys.setlocale(category = 'LC_ALL', locale = 'C')

tbl <- res %>% 
  read_html() %>% 
  html_node(css = 'table.ltb-table') %>% 
  html_table()



