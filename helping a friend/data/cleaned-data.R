library(base)
library(httr)
library(readxl)
library(ggplot2)
library(forcats)
library(dplyr)
library(tidyr)
library(GGally)
library(hexbin)
library(arsenal)
library(haven)

dataset <- read_excel("Data.xlsx")

dataset$infecon <- ifelse(dataset$infecon == "Yes", 1, 0)
dataset$infecon <- as.integer(dataset$infecon)

dataset$gender <- ifelse(dataset$gender == "Female", 1, 0)
dataset$gender <- as.integer(dataset$gender)

dataset$marr <- ifelse(dataset$marr == "Married", 1, 0)
dataset$marr <- as.integer(dataset$marr)

dataset$sub_overc <- ifelse(dataset$sub_overc == "Yes", 1, 0)
dataset$sub_overc <- as.integer(dataset$sub_overc)

dataset <- separate(dataset, mon_inc, c("mon_inc", "inc_level"), sep = '\\(', remove = T)
dataset <- separate(dataset, inc_level, c("inc_level", NA), sep = '\\)', remove = T)

dataset$children <- ifelse(dataset$children == "No Children", 0,
                           ifelse(dataset$children == "Children <18 years old", 1, 2))
dataset$children <- as.integer(dataset$children)

write.csv(dataset, "clean_data.csv", row.names = F)

processing1 <- read_dta("processing1.dta")
processing1$sub_overc <- as.integer(processing1$sub_overc)
processing1 <- na.omit(processing1)

write.csv(processing1, "h4_data.csv", row.names = F)

