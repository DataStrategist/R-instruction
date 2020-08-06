### Exploring data shape transformation, using Tidyr

library(tidyverse)

# Read data in ------------------------------------------------------------

a <- read.table(text = "Item	E	F	G	H
                AAAA	1	2	3	4
                BBBB	5	6	7	8
                CCCC	9	10 11 12
                DDDD	13 14 15 16
                ", header = TRUE)

a

b

# make longer code -------------------------------------------------------------


# repivot example code ---------------------------------------------------------


# Exercises ---------------------------------------------------------------

## 1

## If the following breaks up the height according to sex:
starwars %>% 
  pivot_wider(id_cols = name, names_from = sex, values_from = height)


## how can I break up the same dataset according to skin_color:
________ %>% 
  pivot_wider(id_cols = ____, __________ = ____, values_from = _______)

## 2

## Import Argentina.csv, which consists of the population in Argentina
## in 2019 by gender and age group. 
## Now calculate the % female in the age-group 35-39.
## (hint... if you want to include more than one column in id_cols, use c(),
## for example, id_cols = c(KPI, Year))

## 3 (hard, but real!)

## Import KPIs.csv, Which consists of 20 performance metrics we're using 
## to figure out if our business is doing good or bad. "Actual" is how
## we're actually doing, and "Target" is how we wanted to do.

## please identify the 2 indicators where we've shown the most improvement 
## compared to 2019

