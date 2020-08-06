### Lesson 7 - joins and binds

library(tidyverse)

## Import some toy data
df1 <- read.table(text ="Person	Gender
George	M
Aki	F
Jorge	M
Mohammed	M", header = TRUE) %>% as_tibble

df2 <- read.table(text ="Person	Birthdate
Aki	01/03/2000
Mohammed	01/12/1987
Pepa	12/05/1978
Ryo	02/02/2002", header = TRUE) %>% as_tibble


# Join Types --------------------------------------------------------------

left_join(df1, df2)
inner_join(df1, df2)
full_join(df1, df2)


# Different keys? ---------------------------------------------------------

df2alt <- read.table(text ="Individual	Birthdate
Aki	01/03/2000
Mohammed	01/12/1987
Pepa	12/05/1978
Ryo	02/02/2002", header = TRUE) %>% as_tibble


left_join(df1, df2alt)
left_join(df1, df2alt %>% rename(Person = Individual))
left_join(df1, df2alt %>% select(Person = Individual, Birthdate))
left_join(df1, df2alt, by= c("Person" = "Individual"))

# Binds -------------------------------------------------------------------

df3 <- read.table(text ="Person	Gender
Fanta	M
Jill	F
Abby	F
George	M", header = TRUE) %>% as_tibble

combined_df <- bind_rows(df1,df3)
intersect(df1, combined_df)
setdiff(df1 %>% head(2), combined_df)
setdiff(combined_df, df1 %>% head(2))

union(df1, combined_df)

# Exercises ---------------------------------------------------------

## 1 What if I want to keep stuff in second dataframe only?

## 2 How can I use more than one field in a key?
  
KPI1 <- read_csv("KPIs.csv")

## Let's create some toy data. Suppose some of the data was gathered poorly:
KPI2 <- KPI1 %>% 
  ## let's pick a few rows
  sample_n(35) %>% 
  mutate(quality_issue = 1) %>% 
  select(-Value)

## Join KPI1 to KPI2
  
left_join(KPI1, KPI2)

## But let's be explicit, how can we do it specifying only the true Keys?

## 3 Is bind_rows() exactly the same as full_join? Why or why not? 