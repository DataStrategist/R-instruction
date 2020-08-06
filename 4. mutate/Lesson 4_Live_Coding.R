### Lesson 4: Goal is to introduce: 
### mutate
### combining mutate + ggplot
### combining mutate + dplyr (e.g. mutate + summarize)
### Data set is tidycovid19 data. More info here: https://joachim-gassen.github.io/2020/05/tidycovid19-new-data-and-doc/
### Required packages: tidyverse, readxl, ggeasy, tidycovid

library(tidyverse)
library(readxl) # note that readxl is part of the tidyverse but not one of the core packages loaded with library(tidyverse)

## download COVID data from github
# remotes::install_github("joachim-gassen/tidycovid19")
## read in COVID data
# df <- tidycovid19::download_merged_data(cached=TRUE)
# openxlsx::write.xlsx(df,'covid09072020.xlsx') 

df <- read_xlsx('covid09072020.xlsx') # there are some warnings that can be ignored


## take a look at data


## What are variables: 
## confirmed is: number of confirmed cases on date given 
## deaths is: number of deaths on date given 
## recovered is: number of people who have recovered on date given 



# Exercise 1: remembering ggplot, introducing the concept of 'group' when using geom_line
## Let's plot the number of cases over time for all countries, with a line for each country 




## What happens if we exclude 'group'?  



## Bonus: How to eliminate scientific notation



# Exercise 2: creating new variables with mutate  --------------------------------------------------------------
## plot number of deaths over time for each countries



## Hmm, this is useful, but surely the deaths relate to the number of cases??

## But first... TOO MUUUUCH data!!! Let's get a subset


## How can we compute death rate per country? That's not in our dataset!  Introducing mutate!
## Is death rate the number of deaths/total confirmed cases?





## Or wait, is death rate the number of deaths/(deaths + people who recovered)? 



## mutate and ggplot can be combined! The new variables are available right away. 




## Help! I have too many countries! ggeasy is useful for easy formatting
## there are other ways to edit the appearance of the plot too to be fully customizable






## Exercise:
## mutate is useful for: 

## This is good, but the plot is still horrendous. Can I summarize the data by region?

## Exercise 3: Combining mutate, group_by, and summarize --------------------------------------------------------------
## aggregate the average rate by date and region










## Hmm.... why are some of the regions not showing up?
## A clue is in the error 'rows containing missing values'
## Let's try computing the mean again, excluding missing values 
## We can also combine the filtering/summarize and ggplot!








## Note - it's perfectly ok to save your summarized df en route if you prefer 
## e.g. 










# Exercise 4/Homework: Recalling last week ! --------------------------------------------------------------
## Let's calculate the rate at each timepoint 
## and then remove days where the rate was 0
## then arrange the data chronologically by date

subDF  %>%
  filter(!is.na(region)) %>%
  mutate(rate = deaths/(deaths + recovered)) %>% 
  ____________ %>%  # exclude days where rate was 0
  ____________ # order by earliest date  to latest date


## With that data: 
## find the average rate for each country  


subDF  %>%
  filter(!is.na(region)) %>%
  mutate(rate = deaths/(deaths + recovered)) %>% 
  ____________ %>%  # exclude days where rate was 0
  ____________ # order by earliest date  to latest date
  group_by(_________) %>% 
  drop_na(rate) %>% # an alternative to na.rm = TRUE
  summarize(aveRate = ______(______)) %>% 
  arrange(____(_______))

## Which countries have the highest average rate? Which have the lowest?

