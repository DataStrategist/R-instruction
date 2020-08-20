### Explore the difference between types and classes


# 0 dimension -------------------------------------------------------------

nu <- 1
lo <- TRUE
ch <- "c"
fa <- factor("c")

class(nu)
class(lo)
class(ch)
class(fa)

is.vector(nu)
is.vector(lo)
is.vector(ch)
is.vector(fa)


# 1 dimension -------------------------------------------------------------

nu <- c(1,4)
lo <- c(TRUE, TRUE, F, T)
ch <- c("c","b","3", "TRUE")

x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar") ## with typo

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

fa1 <- factor(x1, levels = month_levels)
fa2 <- factor(x2, levels = month_levels)


## What if we mix types?
c(1, TRUE)
c(1, "1")
c("hello", FALSE)
c("hello", fa1)
c("hello", fa2)
c(5, fa1)
c(5, fa2)

## Thought point: 

## When you mix a number and logical, it coerces to _________
## When you mix a number and character, it coerces to _________
## When you mix a character and logical, it coerces to _________
## When you mix a factor and numeric, it coerces to _________
## When you mix a factor and character, it coerces to _________


# Converting from one type to another -------------------------------------

as.logical(nu)
as.character(nu)
as.numeric(ch)
as.numeric(fa1)

## CAREFUL WITH FACTORS THAT ARE NUMERIC!

real_data <- c(234,56,373724352,234,63462,34,2626, "17 kg")
factor_real_data <- as.factor(real_data)

## Huh, I can prolly convert to numeric, who cares bout stupid ole 17kg
as.numeric(factor_real_data)

#NOOOOO!

########################################
## AXIOM OF FACTORS!
## WHEN NUMBERS COME IN AS FACTORS, CONVERT TO CHARACTER AND THEN TO NUMBER!!!!!!!!!!
########################################

library(tidyverse)
factor_real_data %>% as.character %>% as.numeric


## Note: R will convert things to NA
## Another example

real_data <- c(234,56,373724352,234,63462,34,2626, "17")
factor_real_data <- as.factor(real_data)
factor_real_data %>% as.numeric
factor_real_data %>% as.character %>% as.numeric

# 2 dimensions ------------------------------------------------------------
numeric_matrix <- matrix(c(1,2,3,4,5,6), nrow = 2)

numeric_matrix[1,1] <- "booboo"

numeric_matrix


numeric_data_frame <- data.frame(a = c(1,2,3), b = c(4,5,6))

numeric_data_frame %>% str

numeric_data_frame[1,1] <- "booboo"

numeric_data_frame %>% str


better_numeric_data_frame <- data_frame(a = c(1,2,3), b = c(4,5,6))

better_numeric_data_frame %>% str

better_numeric_data_frame[1,1] <- "booboo"


class(numeric_matrix)
class(numeric_data_frame)
class(better_numeric_data_frame)

## Thought point:
## what's the difference between a matrix and a data frame?

## converting
numeric_matrix %>% as.data.frame
numeric_matrix %>% as_data_frame
better_numeric_data_frame %>% as.matrix

## King of all objects:

list(a = "boom",
     b = c(2,3,456),
     c = data.frame(boom = TRUE, however= "FALSE"))


# Practical stuff! --------------------------------------------------------
df <- gapminder::gapminder

## Miscellaneous point - what do these :: mean?

df %>% 
  group_by(continent) %>% 
  summarize(avepop = mean(pop)) %>% ungroup %>% 
  ggplot(aes(x=continent, y = avepop)) + geom_col()

## ^ How to arrange in order?
## new library: forcats (part of the tidy verse)
## new verb: fct_reorder 

df %>% 
  group_by(continent) %>% 
  summarize(avepop = mean(pop)) %>% ungroup %>% 
  mutate(continent = fct_reorder(continent, avepop)) %>% 
  ggplot(aes(x=continent, y = avepop)) + geom_col()

byCountry <- df %>% 
  group_by(country) %>% head(200) %>%  
  summarize(avepop = mean(pop)) %>% ungroup %>% 
  mutate(country = fct_reorder(country, avepop)) %>% 
  ggplot(aes(x=country, y = avepop)) + geom_col()

byCountry + coord_flip()
