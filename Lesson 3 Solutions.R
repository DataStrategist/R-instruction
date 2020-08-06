## Homework! Solution  -------------------------------------------------------

# HW 1 --------------------------------------------------------------
## What are the 3 countries with the highest average life expectancy?
df %>%
  group_by(country) %>%
  summarize(meanLife = mean(lifeExp)) %>%
  arrange(desc(meanLife))

# Iceland, Sweden, Norway

## HW 2: What country had the highest life expectancy in 2007?

df %>%
  filter(year == 2007) %>% 
  group_by(country) %>%
  summarize(meanLife = mean(lifeExp)) %>%
  arrange(desc(meanLife)) 


## HW 3 --------------------------------------------------------------
## What 2 countries in Asia have the highest maximum population?
df %>%
  filter(continent == "Asia") %>%                    ## deal with "in Asia" part
  group_by(country) %>%                            ## what grouping are we looking for in final answer
  summarize(maxPop = max(pop)) %>%                 ## create the value that we are looking for
  arrange(desc(maxPop)) %>%                           ## arrange so that the top values are at the top
  head(2) %>%                                        ## grab the first 2 rows
  select(country)                                       ## select the portion that was asked for in the question

## note: selecting country and max population is also fine!

## HW 4
## What 2 continents have the highest average life expectancy?
## Start with the text description of what you will do. Then code.

df %>% 
  group_by(continent) %>%      ## need to look at the data by continent
  summarize(meanLifeExp = mean(lifeExp)) %>%     ## calculate the average life expectancy
  arrange(desc(meanLifeExp))  %>%     ## arrange so the top values are at the top
  head(2) %>% ## get just the first 2 rows 
  select(continent)  ## select the continent names 


## HW 5 - FORGET ME NOT! 
## Create a plot of the populations of all the countries in Oceania over time. 
## Countries should be in different colors

df %>%
  filter(continent == "Oceania") %>%
  ggplot(aes(x = year, y = pop, color = country)) + 
  geom_point() + 
  geom_line()


# HW 6  ----------------------------------------------------

### HELP!!!!!!! I MADE A MISATAKE AND IT WONT WORK LOL. WATS WRONG LOL
df %>%
  filter(continent = "Asia") %>%
  ggplot2(aes(x = year, y = gdpPercap, color = Country)) +
  geom_points() %>% 
  geom_line()

df %>%
  filter(continent == "Asia") %>%
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_point() +
  geom_line()

## ^ how to improve?