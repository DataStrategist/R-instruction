### first steps into modelling

library(tidyverse)
library(patchwork)

## let's investigate gapminder pop vs gdpPercap

df <- gapminder::gapminder
df %>% ggplot(aes(lifeExp, gdpPercap))  + geom_point()

## and create a model!
GMmodel <- df %>% lm(formula = lifeExp ~ gdpPercap)

## and explore it
class(GMmodel)
GMmodel
GMmodel %>% summary

## Back to presentation

## explain m, x. Let's try to plot:
df %>% ggplot(aes(lifeExp, gdpPercap))  + geom_point() + 
  geom_abline(slope=7.649e-04, intercept = 5.396e+01, color = "red")

df %>% ggplot(aes(lifeExp, gdpPercap))  + geom_point(alpha=0.1) + 
  geom_abline(slope=7.649e-04, intercept = 5.396e+01, color = "red")

## ^ Yeah, for real!

## Easier way:
df %>% ggplot(aes(lifeExp, gdpPercap))  + geom_point(alpha=0.1) + 
  geom_smooth(method=stats::lm)+ 
  geom_abline(slope=7.649e-04, intercept = 5.396e+01, color = "red")

## ????????????????? https://rfordatascience.slack.com/archives/C6XL6HUG4/p1597921574001400
## Back to presentation

## let's investigate gapminder lifeExpectancy vs continent

df <- gapminder::gapminder
df %>% ggplot(aes(continent, lifeExp))  + geom_boxplot()

## and create a model!
GMmodel <- df %>% lm(formula = lifeExp ~ continent)

## and explore it
class(GMmodel)
GMmodel
GMmodel %>% summary

## ^ something look familiar? Hint:
df %>% group_by(continent) %>% summarize(mean(lifeExp))

## Let Dulcie Explain

## Let's combine continent and gdpPercap

lastModel <- df %>% lm(formula = lifeExp ~ continent + gdpPercap + pop)
summary(lastModel)


## Not tidy
library(broom)

glance(lastModel)

tidy(lastModel)

augment(lastModel)


augment(lastModel) %>% ggplot(aes(x=lifeExp, y =.fitted)) + geom_point()

## Reshape the data!
df %>% lm(formula = lifeExp ~ continent + log(gdpPercap) + pop) %>% summary
