### starting to play with dplyr data using the gapminder datasest 


## Call libraries ----------------------------------------------------------

# install.packages("tidyverse")
# install.packages("gapminder")

library(tidyverse)
library(gapminder)

df <- gapminder


## Quick EDA ---------------------------------------------------------------

## What is the gapminder data? A dataset about life expectancy, population, and GDP for different countries
View(df)
glimpse(df)
head(df)
summary(df)

## Part 1: How do I filter my dataframe? How do I select certain data but not others? How do I reorder my data?

## filter ------------------------------------------------------------------

## get a tibble of data for just Austria in 1962
df %>% 
  filter(country == "Austria", year == 1962)

df %>% 
  filter(country == "Austria" & year == 1962)

## get a tibble of all the data for Austria, plus the data on all countries for 1962
df %>% 
  filter(country == "Austria" | year == 1962)

df %>% 
  filter(country == "Austria", year < 1962)

df %>% 
  filter(country == "Austria", year > 1962)

## Exercise 1 --------------------------------------------------------------

## Fill in:
## filter is:
## & is:
## | is: 
## , is:


## filter, select, unique ----------------------------------------------------------
?select

## get a tibble of all the data for Austria, plus the data on all countries for 1962
## show only the country 

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country) 

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country, year)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country:year)

df %>% 
  select(country:year) %>% 
  filter(country == "Austria" | year == 1962)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country:year, gdpPercap)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country:year, gdpPercap)


# Exercise 2: -------------------------------------------------------------

## Fill in:
## select does:
## in select using ":" does:
## in select using "," does:

# Exercise 3 --------------------------------------------------------------

## Please filter to country "Zimbabwe" and select the year and lifeExp
df %>% 
  filter(country == __________) %>%
  _______(year,lifeExp)


# Exercise 4 --------------------------------------------------------------
## produce a vector of country names with population greater than 500 000 000

## find which countries have a population of greater than 500M AND THEN
## select only the country names
## get rid of duplicates: show the unique country names

df %>%
  filter(pop ___ ________) %>% 
  select(_____) %>% 
  unique

## does this work with multiple columns? 
## now obtain a table of country names with population greater than 500M and show both the country and population
## make sure to remove duplicates

df %>%
  filter(pop ___ ________) %>% 
  ______(country,pop) %>% 
  unique

## unique does: 


## arrange -----------------------------------------------------------------

df %>% 
  filter(year == 1997) %>% 
  arrange(pop)

df %>% 
  filter(year == 1997) %>% 
  arrange(desc(pop))

## arrange does:

## Part 2: How do I get summary statistics on my dataframe?

## group_by, count, summarize ----------------------------------------------
## how many entries do I have in 1997? 
df %>% 
  filter(year == 1997) %>% 
  count %>% 
  ungroup

## how many entries do I have in 1997 for each country? 
df %>% 
  filter(year == 1997) %>% 
  group_by(country) %>%
  count %>% 
  ungroup

## how many entries do I have for each continent and year? 
df %>% 
  group_by(continent, year) %>%
  count %>% 
  ungroup

## what's the average (mean) life expectancy overall? 
df %>%
  summarize(meanlife = mean(lifeExp)) %>% 
  ungroup


## what's the average (mean) life expectancy for each country? 
df %>%
  group_by(country) %>%
  summarize(meanlife = mean(lifeExp)) %>% 
  ungroup


## Homework!  -------------------------------------------------------

# HW 1 --------------------------------------------------------------
## What are the 3 countries with the highest average life expectancy?
df %>%
  group_by(_______) %>%
  ______(meanLife = mean(lifeExp)) %>%
  _________________________

## HW 2: What country had the highest life expectancy in 2007?




## HW 3 --------------------------------------------------------------
## What 2 countries in Asia have the highest maximum population?
df %>%
  filter(_________ == "Asia") %>%                    ## deal with "in Asia" part
  group_by(_________) %>%                            ## what grouping are we looking for in final answer
  summarize(maxPop = max(_____)) %>%                 ## create the value that we are looking for
  arrange(desc(_____)) %>%                           ## arrange so that the top values are at the top
  head(2) %>%                                        ## grab the first 2 rows
  select(______)                                       ## select the portion that was asked for in the question

## HW 4
## What 2 continents have the highest average life expectancy?
## Start with the text description of what you will do. Then code.

## HW 5 - FORGET ME NOT! 
## Create a plot of the populations of all the countries in Oceania over time. 
## Countries should be in different colors

df %>%
  ______(continent == "Oceania") %>%
  ggplot(aes(x == ______, y = ______, color = ________)) + 
  geom_point() + 
  geom_line()


# HW 6  ----------------------------------------------------

### HELP!!!!!!! I MADE A MISATAKE AND IT WONT WORK LOL. WATS WRONG LOL
df %>%
  filter(continent = "Asia") %>%
  ggplot2(aes(x = year, y = gdpPercap, color = Country)) +
  geom_points() %>% 
  geom_line()

## ^ how to improve?