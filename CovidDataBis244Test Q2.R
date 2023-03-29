#Josh Nathan
#BIS 244
#Prof. Davoodi

library(tidyverse)

#Packages
library(tidyverse)
library(ggplot2)

#read csv
amd <- read_csv("AMD.csv")

#Scatterplot with date and adj.close, colored by log(Volume)
ggplot(amd, aes(x = Date, y = Adj.Close, color = log(Volume))) + 
  geom_point() + 
  labs(title = "Highest Price from 2/24/2021 to 2/24/2022", 
       subtitle = "by Josh Nathan as of 3/26/2023",
       x = "Date", 
       y = "AMD Highest Prices", 
       caption = "Source: AMD")
