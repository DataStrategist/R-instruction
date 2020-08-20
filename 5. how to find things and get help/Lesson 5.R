### Lesson 5: Reverse engineering your problem 

## objectives:
## To practice using the main dplyr verbs
## To practice combining dplyr and ggplot
## To understand how to go from desired outcome to solution

## Load libraries 

library(ggplot2)
library(tidyverse)


## Load data

gapminder <- read.csv("gapminder_data.csv", header=TRUE)


## Challenge 1 --------------------------------
## Using the gapminder data, recreate this figure showing gdpPerCap for Nigeria
## For the years 1960 - 2000


gapminder %>%
  filter(_________) %>%
  ggplot(aes(______,________)) +
  geom_______



## Challenge 2 --------------------------------
## Using the gapminder data, recreate this table of the mean, min, and max life expectancy for each continent.


## Challenge 3 --------------------------------

## For the year 2000, recreate the following table showing:
##   - Content
## - Mean GDP per capita
## - Mean population 
## - Mean GDP per billion people 
## 
## Hint: gdpPercap = GDP/population. First, compute GDP. Then divide this by 1 billion.



## Challenge 4: Make this plot!
## Make a plot of gdp per capita for Canada, Mexica, India, and the UK. 
## Note some of the tricky details in the formatting...



## Challene 5: Create a reprex out of Challenge 1, and ask a good question of how to also
## include the mean of world's gdp as points


## Bonus challenge!!
## Make a boxplot summarizing the meanLifeExpectancy for each continent (over all years)


