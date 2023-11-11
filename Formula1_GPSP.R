# Site obtido informações: https://www.f1-telemetry.net/
setwd("~/Documents/PROJECTS/WEBSCRAPING/")
getwd()

# Processar os dados
library(xml2)
library(rvest)

# Manipulação dos dados
library(stringr)
library(dplyr)
library(lubridate)
library(readr)

options(warn = -1)


load_page <- read_html("https://www.f1-telemetry.net/")
load_page

resultado <- load_page %>% html_nodes(".card-body")
head(resultado)

table_information <- load_page %>% 
  html_nodes("table") %>% 
  html_table(fill = TRUE)

table_information
str(table_information)

# Table Last race's result: SAO PAULO GRAND PRIX
race_SP <- table_information[[1]]
View(race_SP)

# Table Drivers Championship
drv_championship <- table_information[[2]]
View(drv_championship)

# Exportando Table para arquivo .csv
write_csv(race_SP, "GPSaoPaulo_Drivers_Championship.csv")
write_csv(drv_championship, "Clas_Driver's_Champioship.csv")

read_csv("GPSaoPaulo_Drivers_Championship.csv")
read_csv("Clas_Driver's_Champioship.csv")
