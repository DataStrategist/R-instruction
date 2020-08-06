## Library calls
library(tidyverse)
library(visNetwork)        

## Get data
df <- AVDG::getProjectData(project, table,replaceLookup = F)
ddf <- AVDG::getProjectData(project, table,replaceLookup = T)

# bla

source("toyDataFunctions.R")



a$person %>% max
b <- BenRegMaker(24445, .5) %>% rownames_to_column() %>% unite(name, first_name, last_name, sep = " ") %>% 
  select(person = rowname, name) %>% mutate(person = as.numeric(person))

a <- a %>% left_join(b)

a <- a %>% select(-buyer)

buyers <- tibble(buyer = 1:442, buyerName = FarmName(442))
a <- a %>% left_join(buyers)
a %>% select(ID, product, village, farmer, buyer = buyerName, date, rate, marketPrice, volume)

a %>% filter(product %in% c("Cashewnut", "Maize",     "Coffee",    "Peanut",    "Cabbagge",  "Ginger",    "Pepper",    "Mirchi" , "Palm Oil" )) -> cc

write_csv(a, "farmerSalesFull.csv")
write_csv(cc, "farmerSales.csv")


# advance data ------------------------------------------------------------

ad <- read_csv("Test Dataset for MIS Specialist.csv")

BenRegMaker(27759,.3) %>% unite(name, first_name, last_name, sep = " ") %>% 
  select(name, ethnicity) %>% bind_cols(ad) %>% write_csv("dirty.csv")
