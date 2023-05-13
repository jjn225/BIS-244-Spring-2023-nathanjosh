# Josh Nathan
# Final Exam Q2
# 5/13/2023

library(tidyverse)
library(ggplot2)


getwd()
setwd("/Users/jeesoo_josh/Documents/GitHub/BIS-244-Spring-2023-nathanjosh")


df <- read.csv("Ukrainian_refugees.csv")
view(df)

countries_select <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czechia", "Denmark", "Estonia", 
                      "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", 
                      "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", 
                      "Slovakia", "Slovenia", "Spain", "Sweden")

df <- df %>%
  mutate(Number.of.Ukrainian.Refugees = as.numeric(gsub(",", "", Number.of.Ukrainian.Refugees, fixed = TRUE)),
         eu = ifelse(Country %in% countries_select, "YES", "NO"))

# sort data by number of refugees, descending
df <- df %>%
  arrange(desc(Number.of.Ukrainian.Refugees))

# create plot
df$Country <- factor(df$Country, levels = df$Country[order(df$Number.of.Ukrainian.Refugees, decreasing = FALSE)])
df$Country <- as.character(df$Country)

p <- ggplot(data = df, aes(x = Number.of.Ukrainian.Refugees, y = Country, fill = eu)) +
  geom_bar(stat = "identity") + 
  labs(x = "Number of Ukrainian Refugees", y = "Country Fled to...", fill = "EU Membership") +
  ggtitle("Sum of Ukrainian Refugees, Feb-Nov 2022", subtitle = "by Josh Nathan as of 5/13/2023") +
  scale_fill_manual(values = c("#003399", "#999999")) +
  theme(legend.position = "bottom",
        axis.text.y = element_text(size = 7),  # Adjust the size of y-axis labels
        axis.text.x = element_text(size = 7)) + # Adjust the size of x-axis labels
  geom_text(aes(label = scales::comma(Number.of.Ukrainian.Refugees)), hjust = -0.2, size = 3, color = "black") +
  theme(plot.title = element_text(color = "orange", face = "bold.italic")) +
  labs(caption = "Latest Date 11/22/2022") +
  scale_x_continuous(labels = scales::comma, breaks = seq(0, max(df$Number.of.Ukrainian.Refugees) + 1000000, by = 500000),
                     limits = c(0, max(df$Number.of.Ukrainian.Refugees) * 1.2)) +
  scale_y_discrete(breaks = df$Country, limits = rev(df$Country))
p
