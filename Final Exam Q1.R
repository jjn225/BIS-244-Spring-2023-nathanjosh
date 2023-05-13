# Josh Nathan
# Final Exam Q1
# 5/13/2023

library(ggplot2)

getwd()
setwd("/Users/jeesoo_josh/Documents/GitHub/BIS-244-Spring-2023-nathanjosh")

df <- read.csv("World of Tanks.csv")
View(df)

df$WR <- as.numeric(sub("%", "", df$Win.Rate))# changing Win.Rate to numeric

p <- ggplot(data = df, aes(x = Battles, y = WR, color = Type)) +
  geom_point() + # plotting the win rate in comparison to battles
  geom_smooth(method = "lm", se = FALSE) + 
  labs(x = "Number of Battles", y = "Win Rate", color = "Type") +
  ggtitle("Win Rate vs Battles-Frequencies Played Tanks") +
  labs(caption = "Creator: Josh Nathan") 
p  
