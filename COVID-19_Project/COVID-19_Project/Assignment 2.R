my_data <- read.csv("~/Documents/GitHub/BIS-244-Spring-2023-nathanjosh/COVID-19_Project/covid-19-data/us-states.csv")
pa_data <- my_data %>% filter(state == "Pennsylvania")
pa_data <- pa_data %>% 
  mutate(incr_cases = c(NA, diff(cases)),
         incr_deaths = c(NA, diff(deaths)))
incr_cases_sd <- sd(pa_data$incr_cases, na.rm = TRUE)
cat("The standard deviation of incr_cases in PA is:", incr_cases_sd, "\n")
