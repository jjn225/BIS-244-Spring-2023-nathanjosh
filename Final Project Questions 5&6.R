# Josh Nathan
# April 30, 2023
## Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

# Load ggplot2 
library(ggplot2)

# Import Data
data <- read.csv("Life-Expectancy-Data-Updated.csv")

# Create a new data frame with the average life expectancy for each region and year
avg_data <- aggregate(data$Life_expectancy, by = list(data$Region, data$Year), mean)
names(avg_data) <- c("Region", "Year", "Avg_Life_Expectancy")

# Create a ggplot with Avg_Life_Expectancy on the y-axis and Year on the x-axis, colored by Region
ggplot(avg_data, aes(x = Year, y = Avg_Life_Expectancy, color = Region)) +
  geom_line() +
  xlab("Year") +
  ylab("Average Life Expectancy") +
  ggtitle("Average Life Expectancy by Region") +
  scale_color_discrete(name = "Region") +
  # Divide the plot by region
  facet_wrap(~ Region, scales = "free")

# Calculate the mean life expectancy for each country
mean_life_exp <- aggregate(Life_expectancy ~ Country, data, mean)

# Filter to find the five countries with the lowest average life expectancy
lowest_life_exp <- head(
  mean_life_exp[order(mean_life_exp$Life_expectancy),],
  n = 5
)$Country

# Filter the data to only include the five countries with the lowest life expectancy
lowest_life_exp_data <- subset(data, Country %in% lowest_life_exp)

# Create a ggplot with Life Expectancy on the y-axis and Year on the x-axis, colored by Country
ggplot(lowest_life_exp_data, aes(x = Year, y = Life_expectancy, color = Country)) +
  geom_line() +
  xlab("Year") +
  ylab("Life Expectancy") +
  scale_color_discrete(name = "Country") +
  # Add facetting for infant deaths
  facet_wrap(~ Country, ncol = 2, scales = "free_y") +
  # Add infant deaths with title
  geom_line(aes(x = Year, y = Infant_deaths), color = "black", linetype = "dashed") +
  labs(title = "Infant Deaths (dashed line) of Countries With Lowest Avg. Life Expectancy")






