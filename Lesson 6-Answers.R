# Exercises ---------------------------------------------------------------

## 1

## If the following breaks up the height according to sex:
starwars %>% 
  pivot_wider(id_cols = name, names_from = sex, values_from = height)


## how can I break up the same dataset according to skin_color:
starwars %>% 
  pivot_wider(id_cols = name, names_from = skin_color, values_from = height)

## 2

## Import Argentina.csv, which consists of the population in Argentina
## in 2019 by gender and age group. 
## Now calculate the % female in the age-group 35-39.
## (hint... if you want to include more than one column in id_cols, use c(),
## for example, id_cols = c(KPI, Year))
library(tidyverse)

Argentina <- readr::read_csv("Argentina.csv")

Argentina %>% 
  pivot_wider(id_cols = Age, names_from = sex, values_from = value) %>% 
  mutate(percent = Female/(Male + Female)) %>% 
  filter(Age == "35-39") %>% select(percent)

## 3 (hard, but real!)

## Import KPIs.csv, Which consists of 20 performance metrics we're using 
## to figure out if our business is doing good or bad. "Actual" is how
## we're actually doing, and "Target" is how we wanted to do.

## please identify the 2 indicators where we've shown the most improvement 
## compared to 2019
KPIs <- readr::read_csv("KPIs.csv")

KPIs %>% 
  pivot_wider(data = ., id_cols = c(KPI,Year),values_from = Value, names_from = What) %>% 
  mutate(per = Actual/Target) %>% arrange(desc(per)) %>% 
  select(-Actual, -Target) %>% 
  pivot_wider(id_cols = KPI, names_from = Year, values_from = per) %>% 
  mutate(improvement = `2020`-`2019`) %>% arrange(desc(improvement))

