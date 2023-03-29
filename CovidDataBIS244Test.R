#Josh Nathan
#BIS 244
#Prof. Davoodi

library(tidyverse)

# setting wd
setwd("C:/Users/jeesoo_josh/Documents/GitHub/BIS-244-Spring-2023-nathanjosh")

#reading csv
covid_data <- read.csv("CovidG7.csv")

#filtering for the 7 given countries
selected_countries <- c("Japan", "France","Germany", "United_Kingdom", "Italy", "Canada", "United_States_of_America")
selected_data <- covid_data %>% filter(countriesAndTerritories %in% selected_countries)

#grouping data based on country and time submitted
summarized_data <- selected_data %>%
  group_by(dateRep, countriesAndTerritories) %>%
  summarize(cases = sum(cases))

#Creating line graph by date and cases, with different colors for different countries
ggplot(summarized_data, aes(x = as.Date(dateRep), y = cases, color = countriesAndTerritories)) + 
  geom_line() + 
  scale_x_date(date_labels = "%Y") + # only show years on the bottom
  #Caption and titles
  labs(x = "Date", y = "New Cases per Day", title = "G7 COVID-19 Case Counts", 
       subtitle = "by Josh Nathan as of 3-26-2023", 
       caption = "Data ECDC Times") + 
  facet_wrap(~countriesAndTerritories, ncol = 3)
