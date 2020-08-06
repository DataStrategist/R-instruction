### Introduction to mutate, and more advanced pipelines

library(tidyverse)

## read in COVID data
# df <- tidycovid19::download_merged_data()
# write_rds(df, "covid2020.04.22.RDS")

df <- read_rds("covid2020.04.22.RDS")

## take a look at data
View(df)


# Exercise 1 --------------------------------------------------------------
## plot the number of cases over time for all countries, highlighting countries
## with more than 100000 cases
df %>% ggplot(aes(x = date, y = confirmed, group = country)) + 
  geom_line()

## eliminate scientific notation
options(scipen = 999)


# Exercise 2 --------------------------------------------------------------
## plot number of deaths over time for all countries, highlighting countries
## with more than 10000 deaths

df %>% ggplot(aes(x = date, y = deaths, group = country)) + 
  geom_line()


## TOO MUUUUCH!!! Let's get a subset
subDFwithRate <- df %>% select(country, region, date, confirmed, recovered, deaths)

## see death rate per country
subDFwithRate %>% mutate(rate = deaths/confirmed)

## but that's not true... time-lag!
subDFwithRate <- subDFwithRate %>% mutate(total = deaths + recovered) %>% 
  filter(total != 0) %>% mutate(betterRate = deaths/total)


subDFwithRate %>% ggplot(aes(x = date, y = betterRate, color = country)) + geom_line()

library(ggeasy)
subDFwithRate %>% ggplot(aes(x = date, y = betterRate, color = country)) + geom_line() +
  easy_remove_legend()


# by region ------------------------------------------------------------

# Exercise 3 --------------------------------------------------------------
## aggregate the average rate by date and region
df1 <- subDFwithRate %>% group_by(date, region) %>% summarize(aveRate = mean(betterRate)) %>% 
  filter(!is.na(region))

df1 %>% ggplot(aes(x= date, y = aveRate, color = region)) +geom_point()+geom_line()


# Exercise 4 --------------------------------------------------------------
## remove rate = 0 from all countries, and then find the average of 
## the latest 3 rates per country. Write a sentence documenting 
## the top 3 countries, the bottom 3 countries and the average.
## EXTRA CREDIT. Discuss why some of the rates are so high!

subDFwithRate %>% filter(betterRate != 0) %>% 
  arrange(desc(date)) %>% 
  group_by(country) %>% 
  drop_na(betterRate) %>% 
  summarize(aveRate = mean(betterRate)) %>% 
  arrange(desc(aveRate))


# Extra credit!! ----------------------------------------------------------

## a better way to calculate death rate is deaths / (deaths + recovered)
## Create an alternative death rate using this number and compare top/bottom/mean rates
## Start from scratch!
subDFwithRate2 <- df %>% select(country, region, date, confirmed, deaths)

## need to take cases 14 days in future
subDFwithRate2 %>% group_by(country) %>% 
  mutate(futureDeaths = lead(deaths, 14)) %>% 
  mutate(rate = futureDeaths/confirmed) %>% 
  drop_na(confirmed) %>% 
  filter(confirmed != 0, rate != 0)

subDFwithRate3 <- df %>% select(country, region, date, recovered, deaths)


subDFwithRate3 %>% mutate(total = deaths + recovered) %>% 
  filter(total != 0) %>% mutate(betterRate = deaths/total)
