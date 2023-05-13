# Josh Nathan
# April 12, 2023
## Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

## Necessary Libraries
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

## Download data
wot_data <- read_csv("~/Desktop/WOT (1).csv")

## Filtering dataset by if they have more than 3 battle
wot_data_filtered <- wot_data %>%
  filter(Battles > 3)

## Converting dataset to numeric values
wot_data_filtered$winr<-as.numeric(parse_number(wot_data_filtered$WR))
wot_data_filtered$surr<-as.numeric(parse_number(wot_data_filtered$Survival))

## Ordering the countries that will be displayed
wot_data_filtered$Nation<-factor(wot_data_filtered$Nation, levels = c("china", "sweden", "uk", "italy", "france", "usa", "czech", "germany", "ussr"))

## Creating the first plot with WR
p <- ggplot(data=wot_data_filtered,
            mapping = aes(x=winr, y=Nation)) +
  labs(x="Win Rate (WR)", y ="")

x <- p+geom_boxplot()
print(x)

## Creating the second plot with SR
g <- ggplot(data=wot_data_filtered,
            mapping = aes(x=surr, y=Nation)) +
  labs(x = "Survival Rate (Survival)", y = "")

y <- g+geom_boxplot()
print(y)

## Displaying the two side by side
library(gridExtra)
grid.arrange(x,y, ncol = 2)

